//
//  HotelTileView.swift
//  TourPortal
//
//  Created by Max Shashkov on 17.04.2022.
//

import SwiftUI
import Kingfisher

struct HotelImageView: View {
  var url: URL?
  var body: some View {
    KFImage(url)
      .resizable()
      .cancelOnDisappear(true)
      .loadDiskFileSynchronously()
      .frame(height: 350)
      .cornerRadius(12)
  }
}

struct HotelTileView: View {
  var hotel: Hotel
  var price: String {
    "От \(hotel.cost)₽"
  }
  var images: [HotelImageView] {
    var hotelImageViews = [HotelImageView]()
    hotel.imagesURL?.forEach { link in
      let hotelImageView = HotelImageView(url: URL(string: link))
      hotelImageViews.append(hotelImageView)
    }
    return hotelImageViews
  }
  var numOfStars: String {
    switch hotel.rating {
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
        .overlay {
          TextOverlay(title: hotel.name, subtitle: numOfStars)
            .allowsHitTesting(false)
        }
        .cornerRadius(12)
      
      Text(hotel.address)
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
    let hotel = searchResultExample[0]
    HotelTileView(hotel: hotel )
  }
}

