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
  private let queue = DispatchQueue(label: "authQueue", qos: .utility, attributes: .concurrent)
  let auth = Auth.auth()
  @Published private(set) var isSignIn: Bool
  
  init() {
    self.isSignIn = auth.currentUser == nil ? false : true
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
