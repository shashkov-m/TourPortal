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
    PageViewController(pages: pages, currentPage: $currentPage)
  }
}

struct PageView_Previews: PreviewProvider {
  static var previews: some View {
    let pages = [Image("0"), Image("1"), Image("2"), Image("3")]
    PageView(pages: pages)
  }
}
