//
//  ContentView.swift
//  TourPortal
//
//  Created by Max Shashkov on 26.03.2022.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
      TabView {
        MainView()
          .tabItem {
            Label ("Поиск", systemImage: "globe.europe.africa")
          }
        NewsfeedView()
          .tabItem {
            Label ("Новости", systemImage: "newspaper")
          }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
