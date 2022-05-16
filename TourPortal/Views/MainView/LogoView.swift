//
//  LogoView.swift
//  TourPortal
//
//  Created by Max Shashkov on 27.03.2022.
//

import SwiftUI

struct LogoView: View {
  var text: LocalizedStringKey
  private let brandImageName = "logo2"
  var body: some View {
    VStack (spacing: 0) {
      Image (brandImageName)
        .resizable()
        .frame(width: 70, height: 80)
        .scaledToFit()
      Text(text)
        .multilineTextAlignment(.center)
        .font(.title.bold())
    }
  }
}

struct LogoView_Previews: PreviewProvider {
  static var previews: some View {
    LogoView(text: "Brand")
  }
}

