//
//  MainView.swift
//  TourPortal
//
//  Created by Max Shashkov on 26.03.2022.
//

import SwiftUI

struct MainView: View {
  let images = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack {
        Text("Поиск выгодных\nтуров")
          .multilineTextAlignment(.center)
          .font(.title.bold())
          .foregroundColor(.primary)
          .padding()
        VStack(alignment: .leading, spacing: 16) {
          Text("Откуда - Волгоград")
          Divider()
          Text("Куда - Стамбул")
        }
        .padding()
        .foregroundColor(.secondary)
        .frame(maxWidth: .infinity)
        .background(Color (UIColor.secondarySystemGroupedBackground))
        .cornerRadius(16)
        HStack(alignment: .firstTextBaseline, spacing: 12) {
          Label("Вылет", systemImage: "airplane.departure")
          Divider()
          Label("Длительность", systemImage: "clock.arrow.circlepath")
          Divider()
          Label("Кто едет", systemImage: "person.3.fill")
        }
        .padding()
        .font(.footnote)
        .foregroundColor(.secondary)
        .frame(maxWidth: .infinity)
        .background(Color (UIColor.secondarySystemGroupedBackground))
        .cornerRadius(16)
      }
      Button("Найти туры") {
        fatalError ("TODO")
      }
      .padding([.leading, .trailing], 100)
      .padding()
      .font(.headline)
      .foregroundColor(.black)
      .background(Color.yellow)
      .cornerRadius(12)
      
      VStack(alignment: .leading, spacing: 0) {
        Text("Популярные направления")
          .font(.headline)
          .padding()
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(alignment: .top, spacing: 8) {
            ForEach(images, id: \.self) { image in
              VStack(alignment: .leading, spacing: 0) {
                Image(image)
                  .resizable()
                  .frame(width: 100, height: 100)
                  .cornerRadius(8)
                Text("Стамбул")
                Text("от ₽80 000")
                  .font(.footnote)
                  .foregroundColor(.gray)
              }
            }
          }
        }
      }
    }
    .padding()
    .background(Color (UIColor.systemGroupedBackground))
  }
}
struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .preferredColorScheme(.light)
  }
}
