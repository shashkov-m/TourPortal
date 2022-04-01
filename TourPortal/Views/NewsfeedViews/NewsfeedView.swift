//
//  NewsfeedView.swift
//  TourPortal
//
//  Created by Max Shashkov on 27.03.2022.
//

import SwiftUI

struct NewsfeedView: View {
  @State var isShowModal = false
  var tap: some Gesture {
    TapGesture(count: 1)
      .onEnded { _ in
        isShowModal.toggle()
      }
  }
  var body: some View {
    NavigationView {
      ScrollView (.vertical, showsIndicators: false) {
        VStack (spacing: 0) {
          NewsTileView(image: Image ("2"))
          NewsTileView(image: Image ("4"))
          NewsTileView(image: Image ("3"))
        }
        .sheet(isPresented: $isShowModal) {
          NewsDetailView(isShowModal: $isShowModal, image: Image("2"))
        }
        .gesture(tap)
      }
      .navigationTitle("Тур Блог")
    }
  }
}

struct NewsfeedView_Previews: PreviewProvider {
  static var previews: some View {
    NewsfeedView()
  }
}
