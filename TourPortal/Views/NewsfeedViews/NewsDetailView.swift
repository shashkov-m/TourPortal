//
//  NewsDetailView.swift
//  TourPortal
//
//  Created by Max Shashkov on 29.03.2022.
//

import SwiftUI

struct NewsDetailView: View {
  @Binding var isShowModal: Bool
  var image:Image
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .leading, spacing: 10) {
        ZStack(alignment: .topTrailing) {
          image
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: 300)
            .clipped()
          
          Button(action: {
            isShowModal.toggle()
          }) {
            Image(systemName: "xmark.circle.fill")
              .resizable()
              .overlay(Circle().stroke(Color.black, lineWidth: 1))
          }
          .foregroundColor(.white)
          .frame(width: 30, height: 30)
          .offset(x: -20, y: 10)
        }
        Text ("""
Сайт рыбатекст поможет дизайнеру, верстальщику, вебмастеру сгенерировать несколько абзацев более менее осмысленного текста рыбы на русском языке, а начинающему оратору отточить навык публичных выступлений в домашних условиях. При создании генератора мы использовали небезизвестный универсальный код речей. Текст генерируется абзацами случайным образом от двух до десяти предложений в абзаце, что позволяет сделать текст более привлекательным и живым для визуально-слухового восприятия.

По своей сути рыбатекст является альтернативой традиционному lorem ipsum, который вызывает у некторых людей недоумение при попытках прочитать рыбу текст. В отличии от lorem ipsum, текст рыба на русском языке наполнит любой макет непонятным смыслом и придаст неповторимый колорит советских времен.
""")
        .font(.title3)
        .padding()
      }
    }
  }
}

struct NewsDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NewsDetailView(isShowModal: .constant(true), image: Image("2"))
  }
}
