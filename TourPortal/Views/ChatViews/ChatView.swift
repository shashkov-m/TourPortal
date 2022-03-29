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
        Image("logo")
          .resizable()
          .frame(width: 80, height: 95)
          .scaledToFit()
          .clipShape(Circle())
          .offset(y: 10)
          .padding(.top, -20)
        Text("TOUR PORTAL")
          .font(.largeTitle)
          .bold()
        Text ("""
Поможем выбрать тур и решить вопросы во время путешествия, а так же ответим на вопросы по работе приложения
""")
        .multilineTextAlignment(.center)
        .font(.body)
        .foregroundColor(.secondary)
        .padding()
        Link (destination: URL(string: "tel://+79377313180")!) {
          Label("Позвонить", systemImage: "phone.fill")
        }
        .padding()
        Divider()
        Text("Свяжитесь с нами в соцсетях и\nмессенджерах")
          .font(.body)
          .multilineTextAlignment(.center)
          .foregroundColor(.secondary)
          .padding()
        SoucialMediaStackView()
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
