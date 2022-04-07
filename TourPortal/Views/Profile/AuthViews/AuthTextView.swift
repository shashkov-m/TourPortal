//
//  AuthTextView.swift
//  TourPortal
//
//  Created by Max Shashkov on 07.04.2022.
//

import SwiftUI

struct AuthTextView: View {
  var headerText: LocalizedStringKey
  var bodyText: LocalizedStringKey
  
  var body: some View {
    VStack(spacing: 12) {
      Text(headerText)
        .font(.title.bold())
      Text(bodyText)
        .font(.body)
        .foregroundColor(.secondary)
        .multilineTextAlignment(.center)
    }
  }
}

struct AuthTextView_Previews: PreviewProvider {
  static var previews: some View {
    AuthTextView(headerText: "Sign in to your profile", bodyText: "Sign in promo")
  }
}
