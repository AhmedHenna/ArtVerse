//
//  AnimatedFontModifier.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/6/23.
//

import SwiftUI

struct AnimatedFontStyle: AnimatableModifier{
    var size: Double
    var weight: Font.Weight = .regular
    var design: Font.Design = .default
    
    var animatableData: Double{
        get {size}
        set {size = newValue}
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
    
}

extension View{
    func animatedFont(size: Double, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View{
        self.modifier(AnimatedFontStyle(size: size, weight: weight, design: design))
    }
}
