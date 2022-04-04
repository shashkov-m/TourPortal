//
//  EmailAuthView.swift
//  TourPortal
//
//  Created by Max Shashkov on 30.03.2022.
//

import SwiftUI
import PartialSheet

struct EmailAuthView: View {
  @Binding var isPresented: Bool
  @Binding var isRootPresented: Bool
  @State private var isEmailAvailable = false
  @State private var email: String = ""
  @State private var password = ""
  
  private func auth() {
    
  }
  
  var body: some View {
    NavigationView {
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
            .submitLabel(.send)
            .onSubmit {
              auth()
            }
        }
        Button {
          auth()
        } label: {
          WideButtonView(imageName: "", text: "Войти", backgroundColor: .blue, textColor: .white, style: .titleOnly)
        }
        .disabled(!(isEmailAvailable && !password.isEmpty))
        Spacer()
        Divider()
        NavigationLink(destination: {
          EmailRegistrationView(email: $email, passoword: $password, isRootPresented: $isRootPresented)
        }, label: {
          WideButtonView(imageName: "", text: "Зарегистрироваться", backgroundColor: .green, textColor: .white, style: .titleOnly)
        })
      }
      .padding()
      .navigationTitle("Авторизация")
      .navigationViewStyle(.stack)
      .navigationBarTitleDisplayMode(.inline)
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
  }
}
