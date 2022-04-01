//
//  SecureInputView.swift
//  TourPortal
//
//  Created by Max Shashkov on 01.04.2022.
//

import SwiftUI

struct SecureInputView: View {
  @State private var isSecured = true
  var title: String
  @Binding var password: String
  
  var body: some View {
    ZStack(alignment: .trailing) {
      Group {
        if isSecured {
          SecureField(title, text: $password)
        } else {
          TextField(title, text: $password)
        }
      }.padding(.trailing, 32)
      Button(action: {
        isSecured.toggle()
      }) {
        Image(systemName: self.isSecured ? "eye" : "eye.slash")
          .accentColor(.gray)
      }
    }
    .frame(maxWidth: .infinity)
    .textContentType(.password)
    .padding()
    .background(Color(UIColor.systemGray6))
    .cornerRadius(12)
    .overlay(
      RoundedRectangle(cornerRadius: 12)
        .stroke(Color(UIColor.systemGray4), lineWidth: 1)
    )
  }
}

struct SecureInputView_Previews: PreviewProvider {
  static var previews: some View {
    SecureInputView(title: "password", password: .constant(""))
  }
}
