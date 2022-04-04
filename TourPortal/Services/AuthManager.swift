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
    let actionCodeSettings = ActionCodeSettings()
    actionCodeSettings.url = URL(string: "tourportaltravel.firebaseapp.com")
    actionCodeSettings.handleCodeInApp = true
    actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
    auth.sendSignInLink(toEmail: email, actionCodeSettings: actionCodeSettings) { error in
      if let error = error {
        print(error)
        return
      }
      UserDefaults.standard.set(email, forKey: "Email")
    }
  }
}
