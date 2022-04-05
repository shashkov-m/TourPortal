//
//  MainTabView.swift
//  TourPortal
//
//  Created by Max Shashkov on 26.03.2022.
//

import SwiftUI
import PartialSheet

struct MainTabView: View {
    var body: some View {
      TabView {
        MainView()
          .tabItem {
            Label("Поиск", systemImage: "globe.europe.africa")
          }
        NewsfeedView()
          .tabItem {
            Label("Тур Блог", systemImage: "newspaper")
          }
        ChatView()
          .tabItem {
            Label("Контакты", systemImage: "phone.fill")
          }
        ProfileView()
          .tabItem {
            Label("Профиль", systemImage: "person.fill")
          }
      }
      .attachPartialSheetToRoot()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
        .environmentObject(AuthManager())
    }
}
