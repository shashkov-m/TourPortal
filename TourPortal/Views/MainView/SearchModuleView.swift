//
//  SearchModuleView.swift
//  TourPortal
//
//  Created by Max Shashkov on 27.03.2022.
//

import SwiftUI

struct SearchModuleView: View {
  var body: some View {
    VStack (spacing: 12) {
      VStack {
        VStack(alignment: .leading, spacing: 16) {
          Text("Откуда - Москва")
          Divider()
          Text("Куда - Стамбул")
        }
        .padding()
        .foregroundColor(.secondary)
        .frame(maxWidth: .infinity)
        .background(Color (UIColor.secondarySystemGroupedBackground))
        .cornerRadius(16)
        
        HStack(spacing: 16) {
          Label("Вылет", systemImage: "airplane.departure")
          Divider()
          Label("Длительность", systemImage: "clock.arrow.circlepath")
          Divider()
          Label("Кто едет", systemImage: "person.3.fill")
        }
        .padding()
        .font(.footnote)
        .foregroundColor(.secondary)
        .frame(maxWidth: .infinity)
        .lineLimit(1)
        .minimumScaleFactor(0.3)
        .background(Color (UIColor.secondarySystemGroupedBackground))
        .cornerRadius(16)
      }
      NavigationLink {
        SearchResultView()
      } label: {
        WideButtonView(imageName: "", text: "Найти туры", backgroundColor: .yellow, textColor: .black, style: .titleOnly)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: 250)
  }
}
struct SearchModule_Previews: PreviewProvider {
  static var previews: some View {
    SearchModuleView()
      .background(Color (UIColor.systemGroupedBackground))
  }
}
