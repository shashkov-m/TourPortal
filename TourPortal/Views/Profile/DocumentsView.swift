//
//  DocumentsView.swift
//  TourPortal
//
//  Created by Max Shashkov on 04.04.2022.
//

import SwiftUI

struct DocumentsView: View {
  let pasports: [Pasport] = [Pasport (userId: "", pasportId: 1815144546, name: "Max", surname: "Shashkov", patronymic: nil, sex: .male, authority: "OUFMS Rf blablabla", citizenship: "Russia", birthDate: "23.08.1995", dateOfIssue: "12.09.2020", expirationDate: "13.09.2030", noExpirationDate: false, noPatronymic: true)]
  @State var selectedPasport: Pasport
  @State private var isShowModal: Bool = false
  var body: some View {
    VStack {
      HStack {
        Spacer()
        Image(systemName: "plus")
      }
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(pasports, id: \.id) { pasport in
            PersonView(name: pasport.name)
              .onTapGesture {
                selectedPasport = pasport
                isShowModal.toggle()
              }
          }
        }
      }
    }
    .padding()
    .sheet(isPresented: $isShowModal) {
      DocumentDetailView(pasport: $selectedPasport)
    }
  }
}

struct DocumentsView_Previews: PreviewProvider {
  static var previews: some View {
    DocumentsView(selectedPasport: Pasport (userId: "", pasportId: 1815144546, name: "Max", surname: "Shashkov", patronymic: nil, sex: .male, authority: "OUFMS Rf blablabla", citizenship: "Russia", birthDate: "23.08.1995", dateOfIssue: "12.09.2020", expirationDate: "13.09.2030", noExpirationDate: false, noPatronymic: true))
  }
}
