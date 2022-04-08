//
//  AuthMethodsView.swift
//  TourPortal
//
//  Created by Max Shashkov on 30.03.2022.
//

import SwiftUI
import PartialSheet

struct AuthMethodsView: View {
  @EnvironmentObject var authManager: AuthManager
  @State private var isEmailTapped = false
  @Binding var isRootPresented: Bool
  var body: some View {
    VStack(spacing: 8) {
      AuthTextView(headerText: "Sign in", bodyText: "Sign in promo 2")
      Group {
        Button {
          isEmailTapped.toggle()
        } label: {
          WideButtonView(imageName: "at", text: "Email", backgroundColor: .blue, textColor: .white, style: .titleAndIcon)
            .font(.title2)
        }
        .sheet(isPresented: $isEmailTapped) {
          EmailAuthView(isPresented: $isEmailTapped, isRootPresented: $isRootPresented)
        }
        SignInWithAppleButton()
          .frame(maxWidth: .infinity, maxHeight: 60)
          .cornerRadius(12)
          .onTapGesture {
            authManager.signInWithApple()
          }
      }
      Divider()
      PrivacyPolicyView()
    }
    .padding()
  }
}

struct AuthVIew_Previews: PreviewProvider {
  static var previews: some View {
    AuthMethodsView(isRootPresented: .constant(true))
      .attachPartialSheetToRoot()
      .environmentObject(AuthManager())
  }
}
