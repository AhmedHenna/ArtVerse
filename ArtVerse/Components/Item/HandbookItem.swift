//
//  HandbookItem.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

struct HandbookItem: View {
    @StateObject private var exploreViewModel = ExploreViewModel()
    
    var handbook: Handbook?
    
    var defaultHandbook: Handbook {
        exploreViewModel.handbooks.indices.contains(0) ? exploreViewModel.handbooks[0] : Handbook(title: "", subtitle: "", description: "", logo: "", image: "", color1: .gray, color2: .white)
    }
    
    var selectedHandbook: Handbook {
        handbook ?? defaultHandbook
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.black.opacity(0.2))
                .frame(height: 90)
                .overlay(
                    Image(selectedHandbook.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 100)
                )
            Text(selectedHandbook.title)
                .fontWeight(.semibold)
                .layoutPriority(1)
            Text(selectedHandbook.subtitle)
                .font(.caption.weight(.medium))
                .foregroundStyle(.secondary)
            Text(selectedHandbook.description)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(3)
            Spacer()
        }
        .padding()
        .frame(maxWidth: 200)
        .frame(height: 260)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.linearGradient(colors: [selectedHandbook.color1, selectedHandbook.color2], startPoint: .topLeading, endPoint: .bottomTrailing))
                .rotation3DEffect(.degrees(10), axis: (x: 0, y: 1, z: 0), anchor: .bottomTrailing)
                .rotationEffect(.degrees(180))
                .padding(.trailing, 40)
        )
    }
}

struct HandbookItem_Previews: PreviewProvider {
    static var previews: some View {
        HandbookItem()
    }
}

