//
//  ChatView.swift
//  TourPortal
//
//  Created by Max Shashkov on 27.03.2022.
//

import SwiftUI

struct ChatView: View {
  var body: some View {
    ScrollView (.vertical, showsIndicators: false) {
      VStack(spacing: 0) {
        LogoView(text: "TOUR PORTAL")
        Text ("""
Поможем выбрать тур и решить вопросы во время путешествия, а так же ответим на вопросы по работе приложения
""")
        .multilineTextAlignment(.center)
        .font(.body)
        .foregroundColor(.secondary)
        .padding()
        PhoneCallButtonView()
        Divider()
          .padding()
        Text("Свяжитесь с нами в соцсетях и\nмессенджерах")
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

struct ChatView_Previews: PreviewProvider {
  static var previews: some View {
    ChatView()
  }
}
