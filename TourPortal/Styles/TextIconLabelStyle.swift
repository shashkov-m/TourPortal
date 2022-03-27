//
//  TextIconLabelStyle.swift
//  TourPortal
//
//  Created by Max Shashkov on 27.03.2022.
//

import SwiftUI

struct TextIconLabelStyle: LabelStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack (spacing: 4) {
      configuration.title
      configuration.icon
    }
  }
}
