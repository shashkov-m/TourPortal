//
//  DocumentDetailView.swift
//  TourPortal
//
//  Created by Max Shashkov on 04.04.2022.
//

import SwiftUI

struct PasportDetailView: View {
    @Binding var pasport: Pasport?
    var body: some View {
      Text(pasport!.name + pasport!.surname)
    }
}

struct PasportDetailView_Previews: PreviewProvider {
    static var previews: some View {
      PasportDetailView(pasport: .constant(Pasport (userId: "", pasportId: 1815144546, name: "Max", surname: "Shashkov", patronymic: nil, sex: .male, authority: "OUFMS Rf blablabla", citizenship: "Russia", birthDate: "23.08.1995", dateOfIssue: "12.09.2020", expirationDate: "13.09.2030", noExpirationDate: false, noPatronymic: true)))
        .environmentObject(AuthManager())
    }
}
