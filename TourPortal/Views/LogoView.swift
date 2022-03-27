//
//  LogoView.swift
//  TourPortal
//
//  Created by Max Shashkov on 27.03.2022.
//

import SwiftUI

struct LogoView: View {
  var body: some View {
    VStack (spacing: 0) {
      Image ("logo")
        .resizable()
        .frame(width: 80, height: 95)
        .scaledToFit()
        .clipShape(Circle())
      Text("Поиск выгодных\nтуров")
        .multilineTextAlignment(.center)
        .font(.title.bold())
    }
  }
}

struct LogoView_Previews: PreviewProvider {
  static var previews: some View {
    LogoView()
      .background(Color (UIColor.systemGroupedBackground))
  }
}
