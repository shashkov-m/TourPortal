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
  var body: some View {
    let test:Bool = !isEmailAvailable && password.count < 10
    NavigationView {
      VStack {
        TextField("email@example.com", text: $email)
          .frame(maxWidth: .infinity)
          .padding()
          .background(Color(UIColor.systemGray6))
          .cornerRadius(12)
          .overlay(
            RoundedRectangle(cornerRadius: 12)
              .stroke(Color(UIColor.systemGray4), lineWidth: 1)
          )
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
          TextField("Password", text: $password)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(12)
            .overlay(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color(UIColor.systemGray4), lineWidth: 1)
            )
            .transition(.opacity)
        }
        Button {
          print(test)
        } label: {
          Text("Войти")
        }
        .disabled(!(isEmailAvailable && !password.isEmpty))
        
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
