//
//  Extensions.swift
//  ShazamAssignment
//
//  Created by Tommy Truong on 1/25/23.
//

import SwiftUI

extension Color {
    static let backgroundColor = Color.init(red: 0.1, green: 0.6, blue: 1)
}

extension Image {
    func shazamIconModifier() -> some View {
        self
            .resizable()
            .frame(width: 100, height: 100)
            .shadow(color: .blue, radius: 10)
    }
}
