//
//  NewsTileView.swift
//  TourPortal
//
//  Created by Max Shashkov on 28.03.2022.
//

import SwiftUI

struct NewsTileView: View {
  var image: Image
  var body: some View {
    ZStack (alignment: .bottomLeading) {
      image
        .resizable()
        .scaledToFill()
        .frame(maxWidth: .infinity, maxHeight: 300)
        .clipped()
        .overlay(Color.black.opacity(0.2))
        .cornerRadius(24)
        .padding()
      VStack (alignment: .leading, spacing: 6) {
        Text ("Текст анонса\nновости")
          .font(.largeTitle)
        Text ("Субтекст краткое описание")
          .font(.headline)
      }
      .foregroundColor(.white)
      .padding()
      .offset(x: 20, y: -25)
      
    }
  }
}

struct NewsTileView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTileView(image: Image ("2"))
    }
}
