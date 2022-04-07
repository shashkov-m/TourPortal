//
//  EmailTextField.swift
//  TourPortal
//
//  Created by Max Shashkov on 01.04.2022.
//

import SwiftUI

struct EmailTextField: View {
  var text: Binding<String>
  var placeholder: LocalizedStringKey = "Email placeholder"
  init(_ text: Binding<String>) {
    self.text = text
  }
  var body: some View {
    TextField(placeholder, text: text)
      .textContentType(.username)
      .keyboardType(.emailAddress)
      .disableAutocorrection(true)
      .textInputAutocapitalization(.never)
      .frame(maxWidth: .infinity)
      .padding()
      .background(Color(UIColor.systemGray6))
      .cornerRadius(12)
      .overlay(
        RoundedRectangle(cornerRadius: 12)
          .stroke(Color(UIColor.systemGray4), lineWidth: 1)
      )
  }
}

struct AuthTextField_Previews: PreviewProvider {
  static var previews: some View {
    EmailTextField(.constant(""))
  }
}
