//
//  SoucialMediaStackView.swift
//  TourPortal
//
//  Created by Max Shashkov on 29.03.2022.
//

import SwiftUI

struct SoucialMediaStackView: View {
  let icons:[Image] = [Image("tg"), Image("vk"), Image("inst")]
  var body: some View {
    HStack(alignment: .center, spacing: 8) {
      Link (destination: URL(string: "https://t.me/iDevcode")!) {
        icons[0]
          .resizable()
          .frame(width: 44, height: 44)
      }
      Link (destination: URL(string: "https://vk.com/tourportal_travel")!) {
        icons[1]
          .resizable()
          .frame(width: 44, height: 44)
      }
      Link (destination: URL(string: "https://instagram.com/tourportal_travel?utm_medium=copy_link")!) {
        icons[2]
          .resizable()
          .frame(width: 44, height: 44)
      }
    }
  }
}

struct SoucialMediaStackView_Previews: PreviewProvider {
  static var previews: some View {
    SoucialMediaStackView()
  }
}
