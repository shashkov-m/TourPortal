//
//  LoggedInView.swift
//  TourPortal
//
//  Created by Max Shashkov on 04.04.2022.
//

import SwiftUI

struct LoggedInView: View {
  var body: some View {
    NavigationView {
      List {
        Section {
          Text("Заказы")
          Text("Личные данные")
          Text("Конфиденциальность")
        } header: {
          Text("Инфо")
        }
        Section {
          PasportsView()
        } header: {
          Text("Документы")
        }
        Section {
          Text("Самые частые вопросы")
          Text("Оформление тура")
        } header: {
          Text("Помощь")
        }
        Section {
          Button(action: {
            
          }, label: {
            Text("Выйти из профиля")
              .foregroundColor(.red)
          })
        }
      }
      .listStyle(.insetGrouped)
      .navigationBarHidden(true)
    }
  }
}

struct LoggedInView_Previews: PreviewProvider {
  static var previews: some View {
    LoggedInView()
  }
}
