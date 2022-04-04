//
//  PersonView.swift
//  TourPortal
//
//  Created by Max Shashkov on 04.04.2022.
//

import SwiftUI

struct PersonView: View {
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
      .foregroundColor(.white)
      .background(.gray)
      .cornerRadius(12)
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(name: "Von H.")
    }
}
