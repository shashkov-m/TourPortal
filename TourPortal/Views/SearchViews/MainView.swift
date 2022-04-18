//
//  MainView.swift
//  TourPortal
//
//  Created by Max Shashkov on 26.03.2022.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack {
          LogoView(text: "Поиск выгодных\nтуров")
          SearchModuleView()
            .padding(.top)
          PopularRoutesView()
          AvailableRoutesView()
        }
      }
      .padding()
      .background(Color (UIColor.systemGroupedBackground))
      .navigationBarHidden(true)
    }
  }
}
struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
