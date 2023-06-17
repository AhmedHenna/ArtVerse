//
//  InputFieldStyle.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/12/23.
//

import SwiftUI

struct InputFieldStyle: ViewModifier {
    var icon: Image
    
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 40)
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            .strokeStyle(cornerRadius: 20)
            .overlay(icon
                    .foregroundStyle(.secondary)
                    .gradientForegorund(colors: [.cyan, .indigo])
                    .frame(width: 36, height: 36)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(8)
            )
    }
}


extension View {
    func inputFieldStyle(icon: Image) -> some View {
        self.modifier(InputFieldStyle(icon: icon))
    }
}
