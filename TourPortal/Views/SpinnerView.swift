//
//  SpinnerView.swift
//  TourPortal
//
//  Created by Max Shashkov on 05.04.2022.
//

import SwiftUI

struct SpinnerView: View {
    var body: some View {
        ProgressView()
        .progressViewStyle(.circular)
        .padding()
        .background(Color(UIColor.systemGray4))
    }
}

struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
