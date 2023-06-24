//
//  TopicsSectionButtons.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/24/23.
//

import SwiftUI

struct TopicsSectionView: View {
    var topics: [Topic]

    var body: some View {
        VStack {
            ForEach(topics) { topic in
                ListRow(topic: topic)
            }
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(.horizontal, 20)
    }
}
