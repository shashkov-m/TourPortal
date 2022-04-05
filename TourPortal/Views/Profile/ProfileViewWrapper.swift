//
//  TestView.swift
//  TourPortal
//
//  Created by Max Shashkov on 05.04.2022.
//

import SwiftUI

struct ProfileViewWrapper: View {
    var body: some View {
        ProfileView()
        .attachPartialSheetToRoot()
    }
}

struct ProfileViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewWrapper()
        .environmentObject(AuthManager())
    }
}
