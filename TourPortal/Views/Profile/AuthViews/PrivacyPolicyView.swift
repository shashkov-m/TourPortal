//
//  PrivacyPolicyView.swift
//  TourPortal
//
//  Created by Max Shashkov on 01.04.2022.
//

import SwiftUI

struct PrivacyPolicyView: View {
  let privacyPolicyKey: LocalizedStringKey = "Privacy policy"
    var body: some View {
      Text(privacyPolicyKey)
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
