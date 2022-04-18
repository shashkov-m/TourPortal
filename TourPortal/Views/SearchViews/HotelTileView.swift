//
//  HotelTileView.swift
//  TourPortal
//
//  Created by Max Shashkov on 17.04.2022.
//

import SwiftUI
import Kingfisher

struct HotelImageView: View {
  var link: String
  var body: some View {
    KFImage(URL(string: link))
      .resizable()
  }
}

struct HotelTileView: View {
  var hotelName: String
  var cost: Double
  var address: String
  var rating: Int
  var imageLinks: [String]
  var price: String {
    "От \(cost)₽"
  }
  var images: [HotelImageView] {
    var hotelImageViews = [HotelImageView]()
    imageLinks.forEach { link in
      let hotelImageView = HotelImageView(link: link)
      hotelImageViews.append(hotelImageView)
    }
    return hotelImageViews
  }
  var numOfStars: String {
    switch rating {
    case 1:
      return "★☆☆☆☆"
    case 2:
      return "★★☆☆☆"
    case 3:
      return "★★★☆☆"
    case 4:
      return "★★★★☆"
    case 5:
      return "★★★★★"
    default:
      return "☆☆☆☆☆"
    }
  }
  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      PageView(pages: images)
        .frame(maxWidth: .infinity, maxHeight: 250)
        .overlay {
          TextOverlay(title: hotelName, subtitle: numOfStars)
            .allowsHitTesting(false)
        }
        .cornerRadius(12)
      
      Text(address)
        .multilineTextAlignment(.leading)
        .font(.footnote)
        .foregroundColor(.gray)
      Text(price)
        .font(.title2.bold())
    }
    .padding()
    
  }
}

struct HotelTileView_Previews: PreviewProvider {
  static var previews: some View {
    HotelTileView(hotelName: "Alean hotel", cost: 96000.00, address: "test address", rating: 3, imageLinks: [""])
  }
}

