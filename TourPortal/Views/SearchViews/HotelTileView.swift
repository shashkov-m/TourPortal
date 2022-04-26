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
    let hotel = Hotel(id: "0",
                      name: "ALEAN FAMILY RESORT & RIVIERA 4*",
                      shortName: "ALEAN RIVIERA 4*",
                      cost: 98000.00,
                      rating: 4,
                      address: "Краснодарский край, г. Анапа, Пионерский пр., 28",
                      imagesURL: [
                        "https://uploads2.stells.info/storage/png/1/1b/11b7daf78e457e25a28c1b91acf957d6.png", "https://uploads2.stells.info/storage/jpg/f/e2/fe2b4c4fea5f6bd34d72b64c1892281f.jpg", "https://uploads2.stells.info/storage/jpg/d/58/d58d65f3e94348f6713795445ab0f47a.jpg", "https://uploads2.stells.info/storage/jpg/a/17/a17406ee5b6df9f1d8552c9ed058dda2.jpg", "https://uploads2.stells.info/storage/jpg/7/fe/7feec5931d852a041fedaa6d9d03e107.jpg", "https://uploads2.stells.info/storage/jpg/3/28/3288658053c0613d4d30800ae66666aa.jpg", "https://uploads2.stells.info/storage/jpg/f/43/f43347055604e4364abf99947f92e085.jpg"], coordinates: nil)
    HotelTileView(hotel: hotel )
  }
}

