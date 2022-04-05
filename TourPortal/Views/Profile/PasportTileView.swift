//
//  PersonView.swift
//  TourPortal
//
//  Created by Max Shashkov on 04.04.2022.
//

import SwiftUI

struct PasportTileView: View {
  let name: String
    var body: some View {
      VStack(alignment: .leading) {
        Label(title: {
          Text("Паспорт")
        }, icon: {
          Image(systemName: "person.crop.square")
        })
        .labelStyle(TextIconLabelStyle())
        Text(name)
      }
      .padding()
      .background(Color(UIColor.secondarySystemBackground))
      .cornerRadius(12)
      .lineLimit(1)
      .frame(maxWidth: 150)
    }
}

struct PasportTileView_Previews: PreviewProvider {
    static var previews: some View {
        PasportTileView(name: "Von H.")
    }
}
