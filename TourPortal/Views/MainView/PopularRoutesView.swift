//
//  PopularRoutesView.swift
//  TourPortal
//
//  Created by Max Shashkov on 27.03.2022.
//

import SwiftUI

struct PopularRoutesView: View {
  let images = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text("Популярные направления")
        .font(.headline)
        .padding()
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: 8) {
          ForEach(images, id: \.self) { image in
            VStack(alignment: .leading, spacing: 0) {
              Image(image)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(8)
              Text("Стамбул")
              Text("от ₽80 000")
                .font(.footnote)
                .foregroundColor(.gray)
            }
          }
        }
      }
    }
  }
}

struct PopularRoutes_Previews: PreviewProvider {
  static var previews: some View {
    PopularRoutesView()
  }
}
