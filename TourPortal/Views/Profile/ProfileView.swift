//
//  ProfileView.swift
//  TourPortal
//
//  Created by Max Shashkov on 05.04.2022.
//

import SwiftUI

struct ProfileView: View {
  @EnvironmentObject var authManager: AuthManager
  var body: some View {
    if authManager.isSignIn {
      SignInView()
    } else {
      AuthView()
        .attachPartialSheetToRoot()
    }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
      .environmentObject(AuthManager())
      .attachPartialSheetToRoot()
  }
}
