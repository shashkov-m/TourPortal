//
//  SearchResultView.swift
//  TourPortal
//
//  Created by Max Shashkov on 16.04.2022.
//

import SwiftUI

struct SearchResultView: View {
  var body: some View {
    ScrollView (.vertical, showsIndicators: true) {
      LazyVStack {
        ForEach(searchResultExample) { hotel in
          HotelTileView(hotel: hotel)
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
    SearchResultView()
  }
}
