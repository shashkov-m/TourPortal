//
//  HotelTileVIew.swift
//  TourPortal
//
//  Created by Max Shashkov on 17.04.2022.
//

import SwiftUI

struct HotelTileVIew: View {
  let images = [HotelImageView(currentImage: Image("0")), HotelImageView(currentImage: Image("1"))]
  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      PageView(pages: images)
        .frame(maxWidth: .infinity, maxHeight: 250)
        .overlay {
          TextOverlay()
            .allowsHitTesting(false)
        }
        .cornerRadius(12)

  Text("Россия, Тюменская область, Тюменский район,19 км Червишевского тракта, строение 1.")
        .multilineTextAlignment(.leading)
        .font(.footnote)
        .foregroundColor(.gray)
      Text("От ₽96 000")
        .font(.title2.bold())
    }
    .padding()
    
  }
}

struct HotelTileVIew_Previews: PreviewProvider {
  static var previews: some View {
    HotelTileVIew()
  }
}

struct HotelImageView: View {
  var currentImage: Image
  var body: some View {
    currentImage
      .resizable()
  }
}
