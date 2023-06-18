//
//  ButtonStyle.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/12/23.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    var fieldsNotEmpty: Bool
    @Environment(\.controlSize) var controlSize
    
    var extraPadding: CGFloat {
        switch controlSize {
        case .mini, .small:
            return 0
        case .regular:
            return 4
        case .large:
            return 12
        @unknown default:
            return 0
        }
    }
    
    var cornerRadius: CGFloat {
        switch controlSize {
        case .mini, .small:
            return 12
        case .regular:
            return 16
        case .large:
            return 20
        @unknown default:
            return 12
        }
    }
    
    
    
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        let backgroundColor = fieldsNotEmpty ? Color.primary.opacity(0.5) : Color(.systemBackground)
        
        return configuration.label
            .padding(.horizontal, 10 + extraPadding)
            .padding(.vertical, 5 + extraPadding)
            .background(
                Group {
                    if fieldsNotEmpty {
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .fill(.linearGradient(colors: [backgroundColor, backgroundColor.opacity(0.2)], startPoint: .top, endPoint: .bottom))
                    } else {
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .fill(Color(.systemBackground))
                    }
                }
            )
            .blendMode(.softLight)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(AngularGradient(colors: [.pink, .purple, .blue, .pink], center: .center, startAngle: .degrees(-90), endAngle: .degrees(270)))
                    .blur(radius: cornerRadius)
            )
            .overlay(
                withAnimation(.easeInOut(duration: 3)){
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .stroke(lineWidth: isPressed ? 2 : 0)
                }
            )
    }
}

extension ButtonStyle where Self == CustomButtonStyle {
    static var customButton: Self {
        return .init(fieldsNotEmpty: false)
    }
}
