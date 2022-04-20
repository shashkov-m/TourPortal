//
//  SearchViewModel.swift
//  TourPortal
//
//  Created by Max Shashkov on 20.04.2022.
//

import Foundation

extension SearchView {
  class ViewModel: ObservableObject {
    @Published var hotels = [Hotel]()
  }
}
