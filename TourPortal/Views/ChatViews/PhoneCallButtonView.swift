//
//  PhoneCallButtonView.swift
//  TourPortal
//
//  Created by Max Shashkov on 29.03.2022.
//

import SwiftUI

struct PhoneCallButtonView: View {
  private let url = URL(string: "tel://+79377313180")
  var body: some View {
    Button (action: {
      guard let url = url else { return }
      UIApplication.shared.open(url)
    }) {
      Label("Позвонить", systemImage: "phone.fill")
    }
    .padding()
    .foregroundColor(.blue)
    .overlay(Capsule().stroke(Color.blue, lineWidth: 1))
    
  }
}

struct PhoneCallButtonView_Previews: PreviewProvider {
  static var previews: some View {
    PhoneCallButtonView()
  }
}
