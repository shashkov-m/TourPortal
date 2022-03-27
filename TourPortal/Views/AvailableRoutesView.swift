//
//  AvailableRoutesView.swift
//  TourPortal
//
//  Created by Max Shashkov on 27.03.2022.
//

import SwiftUI

struct AvailableRoutesView: View {
  let images = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text("Готовые варианты")
        .font(.headline)
        .padding()
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: 8) {
          ForEach(images, id: \.self) { image in
            VStack(alignment: .leading, spacing: 2) {
              Image(image)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(8)
              Text("Стамбул")
              Text("≈ ₽80 000")
                .font(.footnote)
                .foregroundColor(.gray)
              HStack(spacing: 8) {
                Label("2", systemImage: "person.2.fill")
                  .labelStyle(TextIconLabelStyle())
                Label("7", systemImage: "moon.fill")
                  .labelStyle(TextIconLabelStyle())
              }
              .font(.footnote)
              .foregroundColor(.gray)
            }
          }
        }
      }
    }
  }
}

struct AvailableRoutesView_Previews: PreviewProvider {
  static var previews: some View {
    AvailableRoutesView()
  }
}
