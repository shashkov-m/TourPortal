//
//  Pasport.swift
//  TourPortal
//
//  Created by Max Shashkov on 04.04.2022.
//

import Foundation

struct Pasport: Identifiable {
  let id = UUID()
  var userId: String
  var pasportId: Int
  var name: String
  var surname: String
  var patronymic: String?
  var sex: Sex
  var authority: String
  var citizenship: String
  var birthDate: String
  var dateOfIssue: String
  var expirationDate: String?
  var noExpirationDate: Bool
  var noPatronymic: Bool
  
  enum Sex: String {
    case male = "Мужской"
    case female = "Женский"
  }
}
