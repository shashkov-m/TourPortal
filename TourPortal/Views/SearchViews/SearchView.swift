//
//  SearchView.swift
//  TourPortal
//
//  Created by Max Shashkov on 16.04.2022.
//

import SwiftUI

struct SearchView: View {
  var resultArray: [Hotel]
  var body: some View {
    ScrollView (.vertical, showsIndicators: true) {
      LazyVStack {
        ForEach(resultArray) { hotel in
          HotelTileView(hotelName: hotel.shortName, cost: hotel.cost, address: hotel.address, rating: hotel.rating ?? 0, imageLinks: hotel.imagesURL ?? [""])
        }
      }
      .frame(maxWidth: .infinity)
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    let resultArray = [Hotel(id: "0", name: "ALEAN FAMILY RESORT & RIVIERA 4*", shortName: "ALEAN RIVIERA 4*", cost: 96000.00, rating: 4, address: "Краснодарский край, г. Анапа, Пионерский пр., 28", imagesURL: [""])]
    SearchView(resultArray: resultArray)
  }
}
