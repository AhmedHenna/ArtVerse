//
//  ListRow.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

struct ListRow: View {
    var topic: Topic = topics[0]
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Image(systemName: topic.icon)
                    .frame(width: 36, height: 36)
                    .background(.ultraThinMaterial)
                    .mask(Circle())
                Text(topic.title)
                    .fontWeight(.semibold)
                Spacer()
            }
            Divider()
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow()
    }
}

