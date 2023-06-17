//
//  GradientTextModifier.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/17/23.
//

import SwiftUI

struct GradientText: View {
    var text: String = "text here"
    
    var body: some View{
        Text(text)
            .gradientForegorund(colors: [.blue, .purple])
    }
}

extension View{
    func gradientForegorund(colors: [Color]) -> some View{
        self.overlay(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}
