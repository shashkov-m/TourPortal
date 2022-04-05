//
//  EmailAuthView.swift
//  TourPortal
//
//  Created by Max Shashkov on 30.03.2022.
//

import SwiftUI
import PartialSheet

struct EmailAuthView: View {
  @EnvironmentObject var authManager: AuthManager
  @Binding var isPresented: Bool
  @Binding var isRootPresented: Bool
  @State private var isEmailAvailable = false
  @State private var email: String = ""
  @State private var password = ""
  @State private var isSpinnerPresented = false
  @State private var isAlertPresented = false
  @State private var errorMessage = ""
  var body: some View {
    NavigationView {
      ZStack(alignment: .center) {
        VStack(spacing: 12) {
          EmailTextField("email@example.com", text: $email)
            .onChange(of: email) { newValue in
              if newValue.validateEmail() {
                withAnimation {
                  isEmailAvailable = true
                }
              } else if !newValue.validateEmail() && isEmailAvailable {
                withAnimation {
                  isEmailAvailable = false
                }
              }
            }
          if isEmailAvailable {
            SecureInputView(title: "Пароль", password: $password)
              .transition(.opacity)
          }
          Button {
            withAnimation {
              isSpinnerPresented = true
            }
            authManager.signIn(email: email, password: password) { error in
              if let error = error {
                errorMessage = error.localizedDescription
                isAlertPresented.toggle()
                withAnimation {
                  isSpinnerPresented = false
                }
              } else {
                withAnimation {
                  isSpinnerPresented = false
                  isPresented.toggle()
                  isRootPresented.toggle()
                }
              }
            }
          } label: {
            WideButtonView(imageName: "", text: "Войти", backgroundColor: .blue, textColor: .white, style: .titleOnly)
          }
          .disabled(!(isEmailAvailable && !password.isEmpty))
          Spacer()
          Divider()
          NavigationLink(destination: {
            EmailRegistrationView(email: $email, passoword: $password, isModalPresented: $isPresented)
          }, label: {
            WideButtonView(imageName: "", text: "Зарегистрироваться", backgroundColor: .green, textColor: .white, style: .titleOnly)
          })
        }
        if isSpinnerPresented {
          SpinnerView()
        }
      }
      .padding()
      .navigationTitle("Авторизация")
      .navigationViewStyle(.stack)
      .navigationBarTitleDisplayMode(.inline)
      .alert("Ошибка", isPresented: $isAlertPresented) {
        Button("OK", role: .cancel) { }
      } message: {
        Text(errorMessage)
      }
      .toolbar {
        Button {
          isPresented.toggle()
        } label: {
          Image(systemName: "xmark.circle.fill")
            .foregroundColor(.secondary)
        }
      }
    }
  }
}

struct EmailAuthView_Previews: PreviewProvider {
  static var previews: some View {
    EmailAuthView(isPresented: .constant(true), isRootPresented: .constant(true))
      .environmentObject(AuthManager())
  }
}
