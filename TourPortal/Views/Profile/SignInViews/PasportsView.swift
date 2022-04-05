//
//  DocumentsView.swift
//  TourPortal
//
//  Created by Max Shashkov on 04.04.2022.
//

import SwiftUI

struct PasportsView: View {
  let pasportManager = PasportsManager()
  @State private var selectedPasport: Pasport?
  @State private var isShowModal: Bool = false
  var body: some View {
    VStack {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(pasportManager.pasports, id: \.id) { pasport in
            PasportTileView(name: pasport.name)
              .onTapGesture {
                selectedPasport = pasport
                isShowModal.toggle()
              }
          }
        }
      }
      HStack {
        Spacer()
        Button {
          
        } label: {
          Text("Добавить")
//          Image(systemName: "plus")
//            .font(.title2)
        }
      }
    }
    .sheet(isPresented: $isShowModal) {
      PasportDetailView(pasport: $selectedPasport)
    }
  }
}

struct PasportsView_Previews: PreviewProvider {
  static var previews: some View {
    PasportsView()
      .environmentObject(AuthManager())
  }
}
