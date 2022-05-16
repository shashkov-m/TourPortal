//
//  TourPortalApp.swift
//  TourPortal
//
//  Created by Max Shashkov on 26.03.2022.
//

import SwiftUI
import Firebase

@main
struct TourPortalApp: App {
  @StateObject var authManager = AuthManager()
  init() {
    FirebaseApp.configure()
//    self._authManager = StateObject(wrappedValue: AuthManager())
  }
  var body: some Scene {
    WindowGroup {
      MainTabView()
        .environmentObject(authManager)
    }
  }
}
