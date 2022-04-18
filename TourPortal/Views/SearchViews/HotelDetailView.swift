//
//  HotelDetailView.swift
//  TourPortal
//
//  Created by Max Shashkov on 18.04.2022.
//

import SwiftUI

struct HotelDetailView: View {
  let images = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
  var body: some View {
    VStack {
      ScrollView(.horizontal, showsIndicators: true) {
        HStack(spacing: 0) {
          ForEach(images, id: \.self) { image in
            Image(image)
              .resizable()
              .frame(maxWidth: .infinity, maxHeight: 300)
          }
        }
      }
      .ignoresSafeArea()
      Spacer()
    }
  }
}

struct HotelDetailView_Previews: PreviewProvider {
  static var previews: some View {
    HotelDetailView()
  }
}
