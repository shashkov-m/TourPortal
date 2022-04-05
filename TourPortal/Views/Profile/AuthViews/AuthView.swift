//
//  AuthView.swift
//  TourPortal
//
//  Created by Max Shashkov on 27.03.2022.
//

import SwiftUI
import PartialSheet

struct AuthView: View {
  @State private var isModalPresented = false
  var body: some View {
    VStack(spacing: 0) {
      Group {
      Text("Войдите в профиль")
        .font(.title.bold())
      Text("Автозаполнение пассажиров,\nсинхронизация между устройствами\n и подписки на цену")
        .font(.body)
        .foregroundColor(.secondary)
        .multilineTextAlignment(.center)
    }
    .padding()
      PSButton(isPresenting: $isModalPresented) {
        Text("Войти")
          .bold()
          .foregroundColor(.white)
          .frame(maxWidth: .infinity)
          .padding()
          .background(Color.blue)
          .cornerRadius(12)
      }
      .padding()
      Divider()
      Spacer()
    }
    .attachPartialSheetToRoot()
    .partialSheet(isPresented: $isModalPresented) {
      AuthMethodsView(isRootPresented: $isModalPresented)
    }
  }
}

struct AuthView_Previews: PreviewProvider {
  static var previews: some View {
    AuthView()
      .attachPartialSheetToRoot()
      .environmentObject(AuthManager())
  }
}