//
//  NewsfeedView.swift
//  TourPortal
//
//  Created by Max Shashkov on 27.03.2022.
//

import SwiftUI

struct NewsfeedView: View {
  var body: some View {
    NavigationView {
      ScrollView (.vertical, showsIndicators: false) {
        VStack (spacing: 0) {
          NewsTileView(image: Image ("2"))
          NewsTileView(image: Image ("4"))
          NewsTileView(image: Image ("3"))
        }
      }
      .navigationTitle("Новости")
    }
  }
}

struct NewsfeedView_Previews: PreviewProvider {
  static var previews: some View {
    NewsfeedView()
  }
}
