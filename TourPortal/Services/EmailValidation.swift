//
//  EmailValidation.swift
//  TourPortal
//
//  Created by Max Shashkov on 31.03.2022.
//

import Foundation

extension String {
  func validateEmail() -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
  }
}
