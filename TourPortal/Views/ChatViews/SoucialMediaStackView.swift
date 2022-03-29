//
//  SoucialMediaStackView.swift
//  TourPortal
//
//  Created by Max Shashkov on 29.03.2022.
//

import SwiftUI

struct SoucialMediaStackView: View {
  let icons:[Image] = [Image("tg"), Image("vk"), Image("inst")]
    var body: some View {
      HStack(alignment: .center, spacing: 8) {
        Button {
            print("Edit button was tapped")
        } label: {
            icons[0]
            .resizable()
            .frame(maxWidth: 40, maxHeight: 40)
        }
        Button {
            print("Edit button was tapped")
        } label: {
            icons[1]
            .resizable()
            .frame(maxWidth: 40, maxHeight: 40)
        }
        Button {
            print("Edit button was tapped")
        } label: {
            icons[2]
            .resizable()
            .frame(maxWidth: 40, maxHeight: 40)
        }
      }
    }
}

struct SoucialMediaStackView_Previews: PreviewProvider {
    static var previews: some View {
        SoucialMediaStackView()
    }
}
