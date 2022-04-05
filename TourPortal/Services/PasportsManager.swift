//
//  PasportsManager.swift
//  TourPortal
//
//  Created by Max Shashkov on 05.04.2022.
//

import Foundation
import Firebase

class PasportsManager: ObservableObject {
  @Published var pasports = [Pasport (userId: "", pasportId: 1815144546, name: "Max", surname: "Shashkov", patronymic: nil, sex: .male, authority: "OUFMS Rf blablabla", citizenship: "Russia", birthDate: "23.08.1995", dateOfIssue: "12.09.2020", expirationDate: "13.09.2030", noExpirationDate: false, noPatronymic: true)]
  
  func getPasports() {
    
  }
  func deletePasport(pasport: Pasport) {
    
  }
  func editPasport(pasport: Pasport) {
    
  }
}
