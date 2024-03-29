//
//  TitleModifier.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/15/23.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote.weight(.semibold))
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .accessibilityAddTraits(.isHeader)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleModifier())
    }
}
