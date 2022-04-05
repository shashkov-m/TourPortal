//
//  AuthManager.swift
//  TourPortal
//
//  Created by Max Shashkov on 01.04.2022.
//

import Foundation
import Firebase
import SwiftUI

@MainActor final class AuthManager: ObservableObject {
  let auth = Auth.auth()
  @Published private(set) var isSignIn: Bool
  init() {
    self.isSignIn = auth.currentUser == nil ? false : true
    print ("Email ", auth.currentUser?.email)
    print ("is verify? " , auth.currentUser?.isEmailVerified)
  }
  func signIn(email: String, password: String, completion: @escaping (Error?) -> ()) {
    auth.signIn(withEmail: email, password: password) { [weak self] result, error in
      if let error = error {
        completion(error)
        fatalError ("TODO")
      } else if let result = result {
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
  func signUp(email: String, password: String) {
    auth.createUser(withEmail: email, password: password) { [weak self] result, error in
      if let error = error {
        fatalError ("TODO")
      } else if let result = result {
        guard let self = self else { return }
        self.sendEmailVerification(user: result.user)
        withAnimation {
          self.isSignIn = true
        }
      }
    }
  }
  func signInPasswordless(email: String) {
    //    auth.sendSignInLink(toEmail: email, actionCodeSettings: actionCodeSettings) { error in
    //    if let error = error {
    //      print(error)
    //      return
    UserDefaults.standard.set(email, forKey: "Email")
  }
  func sendEmailVerification(user: User) {
    guard let email = user.email else { return }
    let actionCodeSettings = ActionCodeSettings()
    let url = String(format: "https://tourportal.page.link/?email=%@", email)
    actionCodeSettings.url = URL(string: url)
    actionCodeSettings.handleCodeInApp = true
    actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
    user.sendEmailVerification(with: actionCodeSettings) { error in
      print (error?.localizedDescription)
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
