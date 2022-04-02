//
//  EmailRegistrationView.swift
//  TourPortal
//
//  Created by Max Shashkov on 01.04.2022.
//

import SwiftUI

struct EmailRegistrationView: View {
  private let authManager = AuthManager()
  @Binding var email: String
  @Binding var passoword: String
  @Binding var isRootPresented: Bool
  @State private var isSuccess = false
  var body: some View {
    NavigationView {
      VStack(spacing: 18) {
        VStack {
          EmailTextField("Email адрес", text: $email)
          SecureInputView(title: "Пароль", password: $passoword)
        }
        Button {
          authManager.signUp(email: email, password: passoword)
        } label: {
          WideButtonView(imageName: "", text: "Продолжить", backgroundColor: .green, textColor: .white, style: .titleOnly)
        }
        Spacer()
        Divider()
      }
      .padding()
      .navigationTitle("Регистрация")
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden(false)
      .alert("Message", isPresented: $isSuccess) {
        Button("OK", role: .cancel) {
          isRootPresented.toggle()
        }
      }
    }
  }
}

struct EmailRegistrationView_Previews: PreviewProvider {
  static var previews: some View {
    EmailRegistrationView(email: .constant(""), passoword: .constant(""), isRootPresented: .constant(true))
  }
}
