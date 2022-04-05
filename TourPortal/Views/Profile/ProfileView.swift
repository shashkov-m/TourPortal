//
//  ProfileView.swift
//  TourPortal
//
//  Created by Max Shashkov on 05.04.2022.
//

import SwiftUI

struct ProfileView: View {
  var isUserAuth = true
  var body: some View {
    if isUserAuth {
      LoggedInView()
    } else {
      AuthView()
    }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}
