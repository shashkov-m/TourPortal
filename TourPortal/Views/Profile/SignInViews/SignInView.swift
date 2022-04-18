//
//  LoggedInView.swift
//  TourPortal
//
//  Created by Max Shashkov on 04.04.2022.
//

import SwiftUI

struct SignInView: View {
  @EnvironmentObject var authManager: AuthManager
  var body: some View {
    NavigationView {
      VStack(alignment: .leading, spacing: 6) {
        if let user = authManager.auth.currentUser,
           let email = user.email {
          VStack(alignment: .leading, spacing: 6){
            Text(email)
              .font(.title)
              .foregroundColor(.secondary)
          }
          .padding()
        }
        List {
          Section {
            Text("Заказы")
            Text("Личные данные")
            Text("Конфиденциальность")
          } header: {
            Text("Инфо")
          }
          Section {
            PasportsView()
          } header: {
            Text("Документы")
          }
          Section {
            Text("Самые частые вопросы")
            Text("Оформление тура")
          } header: {
            Text("Помощь")
          }
          Section {
            Button(action: {
              print (authManager.auth.currentUser?.isEmailVerified)
              authManager.signOut()
            }, label: {
              Text("Выйти из профиля")
                .foregroundColor(.red)
            })
          }
        }
        .listStyle(.insetGrouped)
      }
      .navigationBarHidden(true)
      .background(Color(UIColor.secondarySystemBackground))
    }
  }
}

struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    SignInView()
      .preferredColorScheme(.light)
      .environmentObject(AuthManager())
  }
}
