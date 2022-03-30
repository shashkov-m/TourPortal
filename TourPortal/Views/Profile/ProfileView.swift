//
//  ProfileView.swift
//  TourPortal
//
//  Created by Max Shashkov on 27.03.2022.
//

import SwiftUI
import PartialSheet

struct ProfileView: View {
  @State private var isModalPresented = false
  var body: some View {
    VStack(spacing: 0) {
      Text("Войдите в профиль")
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
      Spacer()
    }
    .partialSheet(isPresented: $isModalPresented, content: AuthView.init)
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
      .attachPartialSheetToRoot()
  }
}
