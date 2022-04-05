//
//  WideButtonView.swift
//  TourPortal
//
//  Created by Max Shashkov on 30.03.2022.
//

import SwiftUI

struct WideButtonView<S: LabelStyle>: View {
  var imageName: String
  var text: String
  var backgroundColor: Color
  var textColor: Color
  var style: S
  
  var body: some View {
    Label {
      Text(text)
        .foregroundColor(textColor)
    } icon: {
      Image(imageName)
        .resizable()
        .frame(width: 24, height: 24)
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(backgroundColor)
    .cornerRadius(12)
    .labelStyle(style)
  }
}

struct WideButtonView_Previews: PreviewProvider {
  static var previews: some View {
    WideButtonView(imageName: "vk", text: "auth", backgroundColor: .blue, textColor: .white, style: .automatic)
  }
}
