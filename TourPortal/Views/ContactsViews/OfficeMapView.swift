//
//  OfficeMapView.swift
//  TourPortal
//
//  Created by Max Shashkov on 29.03.2022.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
  let id = UUID()
  let location: CLLocationCoordinate2D
}

struct OfficeMapView: View {
  @State private var mapRegion = MKCoordinateRegion (center: CLLocationCoordinate2D (latitude: 48.70949, longitude: 44.50343), span: MKCoordinateSpan (latitudeDelta: 0.2, longitudeDelta: 0.1))
  private let officeLocation = Location (location: CLLocationCoordinate2D (latitude: 48.70949, longitude: 44.50343))
    var body: some View {
      Map(coordinateRegion: $mapRegion, annotationItems: [officeLocation]) { location in
        MapMarker(coordinate: location.location)
      }
      .frame(width: nil, height: 300)
      .cornerRadius(16)
      .padding()
    }
}

struct OfficeMapView_Previews: PreviewProvider {
    static var previews: some View {
        OfficeMapView()
    }
}
