//
//  CircularView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

struct CircularView: View {
    var value: CGFloat = 0.5
    @State var showProgressBar = false
    
    var body: some View {
        Circle()
            .trim(from: 0, to: showProgressBar ? value : 0)
            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
            .fill(.angularGradient(colors: [.purple, .pink, .purple],
                                   center: .center, startAngle: .degrees(0),
                                   endAngle: .degrees(360)))
            .rotationEffect(.degrees(270))
            .onAppear{
                withAnimation(.spring().delay(0.5)){
                    showProgressBar = true
                }
            }
            .onDisappear{
                showProgressBar = false
            }
    }
}

struct CircularView_Previews: PreviewProvider {
    static var previews: some View {
        CircularView()
    }
}
