//
//  SignInWithAppleButton.swift
//  TourPortal
//
//  Created by Max Shashkov on 08.04.2022.
//

import SwiftUI
import AuthenticationServices
struct SignInWithAppleButton: UIViewRepresentable {
  @Environment(\.colorScheme) var colorScheme  
  func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
    return ASAuthorizationAppleIDButton(type: .continue,
                                        style: colorScheme == .dark ? .white: .black)
  }
  
  func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    
  }
}

struct SignInWithApple_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithAppleButton()
    }
}
