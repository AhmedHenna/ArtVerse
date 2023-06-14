//
//  Styles.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 5/31/23.
//

import SwiftUI

struct StrokeModifer: ViewModifier{
    var cornerRadius: CGFloat
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(colorScheme == .dark ? 0.3 : 0.4),
                            .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
                        ],startPoint: .top, endPoint: .bottom
                    )
                )
                .blendMode(.overlay)
        )
    }
}


extension View{
    func strokeStyle(cornerRadius: CGFloat = 30) -> some View{
        modifier(StrokeModifer(cornerRadius: cornerRadius))
    }
}
