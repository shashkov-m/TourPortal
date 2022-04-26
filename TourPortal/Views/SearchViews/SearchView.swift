//
//  SearchView.swift
//  TourPortal
//
//  Created by Max Shashkov on 16.04.2022.
//

import SwiftUI

struct SearchView: View {
  var viewModel = SearchViewModel()
  var body: some View {
    ScrollView (.vertical, showsIndicators: true) {
      LazyVStack {
        ForEach(viewModel.searchResultExample) { hotel in
          HotelTileView(hotelName: hotel.shortName, cost: hotel.cost, address: hotel.address, rating: hotel.rating ?? 0, imageLinks: hotel.imagesURL ?? [""])
            .frame(height: 350)
        }
      }
      .frame(maxWidth: .infinity)
    }
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .principal) {
        Text("Анапа / 14 июня / 7 ночей")
          .font(.footnote)
          .padding()
          .background(.regularMaterial)
          .cornerRadius(12)
      }
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}
