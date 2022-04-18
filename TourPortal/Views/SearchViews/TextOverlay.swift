//
//  TextOverlay.swift
//  TourPortal
//
//  Created by Max Shashkov on 18.04.2022.
//

import SwiftUI

struct TextOverlay: View {
  var gradient: LinearGradient {
    .linearGradient(
      Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
      startPoint: .bottom,
      endPoint: .center)
  }
  var title: String
  var subtitle: String
  var body: some View {
    ZStack(alignment: .bottomLeading) {
      gradient
      VStack(alignment: .leading) {
        Text(title)
          .font(.title)
          .bold()
        Text(subtitle)
      }
      .padding()
    }
    .foregroundColor(.white)
  }
}

struct TextOverlay_Previews: PreviewProvider {
  static var previews: some View {
    TextOverlay(title: "Акварель-Family", subtitle: "Акварель-Family")
  }
}
