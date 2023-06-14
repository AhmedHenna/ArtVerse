//
//  ButtonStyle.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/12/23.
//

import SwiftUI

struct CustomButtonStyle : ButtonStyle{
    @Environment(\.controlSize) var controlSize
    
    var extraPadding: CGFloat{
        switch controlSize {
        case .mini:
            return 0
        case .small:
            return 0
        case .regular:
            return 4
        case .large:
            return 12
        default:
            return 0
        }
    }
    
    var cornerRadius: CGFloat{
        switch controlSize{
        case .mini:
            return 12
        case .small:
            return 12
        case .regular:
            return 16
        case .large:
            return 20
        default:
            return 12
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 10 + extraPadding)
            .padding(.vertical, 5 + extraPadding)
            .background(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(.linearGradient(colors: [Color(.systemBackground), Color(.systemBackground).opacity(0.5)], startPoint: .top, endPoint: .bottom)))
            .blendMode(.softLight)
            .background(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(AngularGradient(colors: [.pink, .purple, .blue, .pink], center: .center,
                                      startAngle: .degrees(-90), endAngle: .degrees(270)))
                    .blur(radius: cornerRadius)
            )
            .strokeStyle(cornerRadius: cornerRadius)
    }
}

extension ButtonStyle where Self == CustomButtonStyle{
    static var customButton: Self{
        return .init()
    }
}
