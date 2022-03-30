//
//  AuthView.swift
//  TourPortal
//
//  Created by Max Shashkov on 30.03.2022.
//

import SwiftUI
import PartialSheet

struct AuthView: View {
  var body: some View {
    VStack(spacing: 8) {
      Text("Вход в профиль")
        .font(.title.bold())
      Text("Создавайте подписки на изменения цен, сохраняйте паспорта для будущих покупок.")
        .font(.body)
        .foregroundColor(.secondary)
      Group {
        Button {
        } label: {
          WideButtonView(imageName: "mail", text: "Email", backgroundColor: .blue, textColor: .white)
        }
        Button {
        } label: {
          WideButtonView(imageName: "appleicon", text: "Продолжить с Apple", backgroundColor: Color(UIColor.lightGray), textColor: .white)
        }
        Button {
        } label: {
          WideButtonView(imageName: "google", text: "Google", backgroundColor: Color (UIColor.systemGroupedBackground), textColor: .gray)
        }
      }
      Divider()
      Text("Авторизуясь, вы соглашаетесь с\n Лицензионным соглашением и Политикой конфиденциальности")
        .font(.caption2)
        .foregroundColor(.secondary)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
    }
    .padding()
  }
}

struct AuthVIew_Previews: PreviewProvider {
  static var previews: some View {
    AuthView()
  }
}
