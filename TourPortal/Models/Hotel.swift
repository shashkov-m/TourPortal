//
//  Hotel.swift
//  TourPortal
//
//  Created by Max Shashkov on 18.04.2022.
//

import Foundation

struct Hotel: Identifiable {
  let id: String
  let name: String
  let shortName: String
  let cost: Double
  let rating: Int?
  let address: String
  let imagesURL: [String]?
}

struct HotelDetails {
  let description: String
  let images: [String]
}
