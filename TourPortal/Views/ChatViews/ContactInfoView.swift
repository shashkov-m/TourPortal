//
//  ContactInfoView.swift
//  TourPortal
//
//  Created by Max Shashkov on 27.03.2022.
//

import SwiftUI

struct ContactInfoView: View {
  var body: some View {
    ScrollView (.vertical, showsIndicators: false) {
      VStack(spacing: 0) {
        LogoView(text: "Brand")
        Text ("Contact info title")
        .multilineTextAlignment(.center)
        .font(.body)
        .foregroundColor(.secondary)
        .padding()
        PhoneCallButtonView()
        Divider()
          .padding()
        Text("Contact info title2")
          .font(.body)
          .multilineTextAlignment(.center)
          .foregroundColor(.secondary)
        SoucialMediaStackView()
          .padding(.top)
        Divider()
          .padding()
        OfficeInfoView()
        OfficeMapView()
      }
    }
  }
}

struct ContactInfoView_Previews: PreviewProvider {
  static var previews: some View {
    ContactInfoView()
  }
}
