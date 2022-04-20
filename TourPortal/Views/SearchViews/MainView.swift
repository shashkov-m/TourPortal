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
          Button {
            Alean.shared.getTourList(departureCity: "Анапа", from: Date(timeIntervalSinceNow: 605_000), till: Date(timeIntervalSinceNow: 805_000), durationMin: 5, durationMax: 8) { result in
              switch result {
              case .success(let data):
                print("data", data)
              case .failure(let error):
                print(error)
              }
            }
          } label: {
            Text("Alean")
          }
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
