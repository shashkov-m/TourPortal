//
//  AuthView.swift
//  TourPortal
//
//  Created by Max Shashkov on 30.03.2022.
//

import SwiftUI
import PartialSheet

struct AuthView: View {
  @State private var isEmailTapped = false
  @Binding var isRootPresented: Bool
  private let viewModel = ViewModel()
  var body: some View {
    VStack(spacing: 8) {
      Text("Вход в профиль")
        .font(.title.bold())
      Text("Создавайте подписки на изменения цен, сохраняйте паспорта для будущих покупок.")
        .font(.body)
        .foregroundColor(.secondary)
      Group {
        Button {
          isEmailTapped.toggle()
        } label: {
          WideButtonView(imageName: "at", text: "Email", backgroundColor: .blue, textColor: .white, style: .titleAndIcon)
        }
        .sheet(isPresented: $isEmailTapped) {
          EmailAuthView(isPresented: $isEmailTapped, isRootPresented: $isRootPresented)
        }
        Button {
        } label: {
          WideButtonView(imageName: "appleicon", text: "Продолжить с Apple", backgroundColor: Color(UIColor.lightGray), textColor: .white, style: .titleAndIcon)
        }
        Button {
        } label: {
          WideButtonView(imageName: "google", text: "Google", backgroundColor: Color (UIColor.systemGroupedBackground), textColor: .gray, style: .titleAndIcon)
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
    AuthView(isRootPresented: .constant(true))
      .attachPartialSheetToRoot()
  }
}
