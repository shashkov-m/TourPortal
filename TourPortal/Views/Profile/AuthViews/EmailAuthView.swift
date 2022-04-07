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
  @State private var credentials = Credentials()
  @State private var isSpinnerPresented = false
  @State private var isAlertPresented = false
  @State private var errorMessage = ""
  @State private var isEmailAvailable = false
  @Binding var isPresented: Bool
  @Binding var isRootPresented: Bool
  var body: some View {
    NavigationView {
      ZStack(alignment: .center) {
        VStack(spacing: 12) {
          EmailTextField($credentials.email)
            .onChange(of: credentials.email) { newValue in
              if newValue.validateEmail() {
                withAnimation { isEmailAvailable = true }
              } else if !newValue.validateEmail() && isEmailAvailable {
                withAnimation { isEmailAvailable = false }
              }
            }
          if isEmailAvailable {
            SecureInputView(password: $credentials.password)
              .transition(.opacity)
          }
          Button {
            withAnimation {
              isSpinnerPresented = true
            }
            authManager.signIn(email: credentials.email, password: credentials.password) { error in
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
            WideButtonView(imageName: "", text: "Sign in button", backgroundColor: .blue, textColor: .white, style: .titleOnly)
          }
          .disabled(!(isEmailAvailable && !credentials.password.isEmpty))
          Spacer()
          Divider()
          NavigationLink(destination: {
            EmailRegistrationView(email: $credentials.email, passoword: $credentials.password, isModalPresented: $isPresented)
          }, label: {
            WideButtonView(imageName: "", text: "Sign up button", backgroundColor: .green, textColor: .white, style: .titleOnly)
          })
        }
        if isSpinnerPresented {
          SpinnerView()
        }
      }
      .padding()
      .navigationTitle("Sign in nav title")
      .navigationViewStyle(.stack)
      .navigationBarTitleDisplayMode(.inline)
      .alert("Error", isPresented: $isAlertPresented) {
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
