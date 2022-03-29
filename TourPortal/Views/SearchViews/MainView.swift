//
//  MainView.swift
//  TourPortal
//
//  Created by Max Shashkov on 26.03.2022.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack {
        LogoView(text: "Поиск выгодных\nтуров")
        SearchModuleView()
        PopularRoutesView()
        AvailableRoutesView()
      }
    }
    .padding()
    .background(Color (UIColor.systemGroupedBackground))
  }
}
struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
