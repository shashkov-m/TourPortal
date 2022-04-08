//
//  AuthManager.swift
//  TourPortal
//
//  Created by Max Shashkov on 01.04.2022.
//

import Firebase
import SwiftUI
import AuthenticationServices
import CryptoKit

@MainActor final class AuthManager: NSObject, ObservableObject {
  private let queue = DispatchQueue(label: "authQueue", qos: .utility, attributes: .concurrent)
  let auth = Auth.auth()
  @Published private(set) var isSignIn: Bool = false
  @Published var isAuthError: Bool = false
  var authErrorMessage = ""
  private var currentNonce: String?
  
  override init() {
    super.init()
    Task { @MainActor in
      self.isSignIn = auth.currentUser == nil ? false : true
    }
  }
  
  func signIn(email: String, password: String, completion: @escaping (Error?) -> (Void)) {
    auth.signIn(withEmail: email, password: password) { [weak self] result, error in
      if let error = error {
        completion(error)
      } else {
        completion(nil)
        guard let self = self else { return }
        Task { @MainActor in
          withAnimation {
            self.isSignIn = true
          }
        }
      }
    }
  }
  
  func signUp(email: String, password: String, completion: @escaping (Error?) -> (Void)) {
    auth.createUser(withEmail: email, password: password) { [weak self] result, error in
      if let error = error {
        completion(error)
      } else if let result = result {
        completion(nil)
        guard let self = self else { return }
        withAnimation {
          self.isSignIn = true
        }
        result.user.sendEmailVerification()
      }
    }
  }
  
  func signOut() {
    do {
      try auth.signOut()
      withAnimation {
        isSignIn = false
      }
    } catch {
      print (error.localizedDescription)
    }
  }
}

//MARK: - Sign in with Apple
extension AuthManager: ASAuthorizationControllerDelegate {
  func signInWithApple() {
    let nonce = randomNonceString()
    currentNonce = nonce
    let request = ASAuthorizationAppleIDProvider().createRequest()
    request.requestedScopes = [.fullName, .email]
    request.nonce = sha256(nonce)
    let authorizationController = ASAuthorizationController(authorizationRequests: [request])
    authorizationController.delegate = self
    authorizationController.performRequests()
  }
  private func randomNonceString(length: Int = 32) -> String {
    precondition(length > 0)
    let charset: [Character] =
    Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
    var result = ""
    var remainingLength = length
    while remainingLength > 0 {
      let randoms: [UInt8] = (0 ..< 16).map { _ in
        var random: UInt8 = 0
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
        if errorCode != errSecSuccess {
          fatalError(
            "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
          )
        }
        return random
      }
      randoms.forEach { random in
        if remainingLength == 0 {
          return
        }
        if random < charset.count {
          result.append(charset[Int(random)])
          remainingLength -= 1
        }
      }
    }
    return result
  }
  private func sha256(_ input: String) -> String {
    let inputData = Data(input.utf8)
    let hashedData = SHA256.hash(data: inputData)
    let hashString = hashedData.compactMap {
      String(format: "%02x", $0)
    }.joined()
    return hashString
  }
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
      guard let nonce = currentNonce else {
        fatalError("Invalid state: A login callback was received, but no login request was sent.")
      }
      guard let idToken = credential.identityToken, let idTokenString = String(data: idToken, encoding: .utf8) else {
        isAuthError = true
        authErrorMessage = "Ошибка получения токена при авторизации через Apple ID"
        return
      }
      let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com",
                                                        idToken: idTokenString,
                                                        rawNonce: nonce)
      auth.signIn(with: firebaseCredential) { [weak self] result, error in
        if let error = error {
          self?.isAuthError = true
          self?.authErrorMessage = error.localizedDescription
        } else {
          self?.isSignIn = true
        }
      }
    }
  }
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    isAuthError = true
    authErrorMessage = error.localizedDescription
  }
}
