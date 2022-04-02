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
  init() {
    FirebaseApp.configure()
  }
  var body: some Scene {
    WindowGroup {
      MainTabView()
    }
  }
}
