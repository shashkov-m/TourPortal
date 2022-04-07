//
//  EmailRegistrationView.swift
//  TourPortal
//
//  Created by Max Shashkov on 01.04.2022.
//

import SwiftUI

struct EmailRegistrationView: View {
  @EnvironmentObject var authManager: AuthManager
  @Binding var email: String
  @Binding var passoword: String
  @Binding var isModalPresented: Bool
  @State private var isError = false
  @State private var isSpinnerPresented = false
  @State private var errorMessage = ""
  var body: some View {
    VStack(spacing: 18) {
      VStack {
        EmailTextField($email)
        SecureInputView(password: $passoword)
      }
      Button {
        withAnimation {
          isSpinnerPresented = true
        }
        authManager.signUp(email: email, password: passoword) { error in
          if let error = error {
            errorMessage = error.localizedDescription
            withAnimation {
              isSpinnerPresented = false
              isError.toggle()
            }
          } else {
            withAnimation {
              isSpinnerPresented = false
              isModalPresented.toggle()
            }
          }
        }
      } label: {
        WideButtonView(imageName: "", text: "Продолжить", backgroundColor: .green, textColor: .white, style: .titleOnly)
      }
      Spacer()
      Divider()
    }
    .padding()
    .navigationTitle("Регистрация")
    .navigationBarTitleDisplayMode(.inline)
    .alert("Ошибка", isPresented: $isError) {
      Button("OK", role: .cancel) { }
    } message: {
      Text(errorMessage)
    }
  }
}

struct EmailRegistrationView_Previews: PreviewProvider {
  static var previews: some View {
    EmailRegistrationView(email: .constant(""), passoword: .constant(""), isModalPresented: .constant(true))
      .environmentObject(AuthManager())
  }
}
