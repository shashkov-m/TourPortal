//
//  PrivacyPolicyView.swift
//  TourPortal
//
//  Created by Max Shashkov on 01.04.2022.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
      Text("Авторизуясь, вы соглашаетесь с\n Лицензионным соглашением и Политикой конфиденциальности")
        .font(.caption2)
        .foregroundColor(.secondary)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
