//
//  AuthManager.swift
//  TourPortal
//
//  Created by Max Shashkov on 01.04.2022.
//

import Foundation
import Firebase

class AuthManager: ObservableObject {
  let auth = Auth.auth()
  @Published var user: User?
  func signIn(email: String, password: String) {
    auth.signIn(withEmail: email, password: password) { [weak self] result, error in
      if let error = error {
        fatalError ("TODO")
      } else if let result = result {
        guard let self = self else { return }
        self.user = result.user
      }
    }
  }
  func signUp(email: String, password: String) {
    auth.createUser(withEmail: email, password: password) { [weak self] result, error in
      if let error = error {
        fatalError ("TODO")
      } else if let result = result {
        guard let self = self else { return }
        self.user = result.user
      }
    }
  }
  func signInPasswordless(email: String) {
    auth.sendSignInLink(toEmail: email, actionCodeSettings: ActionCodeSettings) { <#Error?#> in
      <#code#>
    }
  }
}
