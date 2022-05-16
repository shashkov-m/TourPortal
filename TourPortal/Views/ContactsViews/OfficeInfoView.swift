//
//  OfficeInfoView.swift
//  TourPortal
//
//  Created by Max Shashkov on 29.03.2022.
//

import SwiftUI

struct OfficeInfoView: View {
  var body: some View {
    VStack(spacing: 8) {
      Text("Адрес офиса в Волгограде")
        .font(.title3)
        .bold()
      VStack(spacing:6) {
        Text("ул. Краснознаменская, 23")
        Text("Режим работы:\nпн-пт 09-18 · сб 10-18 · вс выходной")
        Text("Телефон:\n+7 937 731-31-80")
      }
      .font(.body)
      .foregroundColor(.secondary)
      .multilineTextAlignment(.center)
    }
  }
}

struct OfficeInfoView_Previews: PreviewProvider {
  static var previews: some View {
    OfficeInfoView()
  }
}
