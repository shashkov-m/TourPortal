//
//  AuthView.swift
//  TourPortal
//
//  Created by Max Shashkov on 27.03.2022.
//

import SwiftUI
import PartialSheet

struct AuthView: View {
  @EnvironmentObject var authManager: AuthManager
  @State private var isModalPresented = false
  var body: some View {
    VStack(spacing: 6) {
      AuthTextView(headerText: "Sign in to your profile", bodyText: "Sign in promo")
    .padding()
      Button {
        isModalPresented.toggle()
      } label: {
        WideButtonView(imageName: "", text: "Sign in button", backgroundColor: .blue, textColor: .white, style: .titleOnly)
      }
      .padding()
      Divider()
      Spacer()
    }
    .alert("Error", isPresented: $authManager.isAuthError) {
      Button("OK", role: .cancel) { }
    } message: {
      Text(authManager.authErrorMessage)
    }
    .attachPartialSheetToRoot()
    .partialSheet(isPresented: $isModalPresented) {
      AuthMethodsView(isRootPresented: $isModalPresented)
      
    }
  }
}

struct AuthView_Previews: PreviewProvider {
  static var previews: some View {
    AuthView()
      .attachPartialSheetToRoot()
      .environmentObject(AuthManager())
  }
}
