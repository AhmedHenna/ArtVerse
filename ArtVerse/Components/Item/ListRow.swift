//
//  ListRow.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

struct ListRow: View {
    @StateObject private var mainViewModel = MainViewModel()

    var topic: Topic?
    
    var defaultTopic: Topic {
        mainViewModel.topics[1]
    }
    
    var selectedTopic: Topic {
        topic ?? defaultTopic
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Image(systemName: selectedTopic.icon)
                    .frame(width: 36, height: 36)
                    .background(.ultraThinMaterial)
                    .mask(Circle())
                Text(selectedTopic.title)
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
