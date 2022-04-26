//
//  PageView.swift
//  TourPortal
//
//  Created by Max Shashkov on 18.04.2022.
//

import SwiftUI

struct PageView<Page: View>: View {
  var pages: [Page]
  @State private var currentPage = 0
  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      PageViewController(pages: pages, currentPage: $currentPage)
      PageControl(numberOfPages: pages.count, currentPage: $currentPage)
        .frame(maxWidth: 150)
    }
  }
}

struct PageView_Previews: PreviewProvider {
  static var previews: some View {
    let pages = [Image("0").resizable(), Image("1"), Image("2"), Image("3")]
    PageView(pages: pages)
      .frame(maxWidth: .infinity, maxHeight: 250)
      .cornerRadius(12)
      .padding()
  }
}
