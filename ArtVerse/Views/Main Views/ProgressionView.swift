//
//  NotificationsView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

struct ProgressionView: View {
    @StateObject private var mainViewModel = MainViewModel()

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                progressAllSections
            }
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(AppBar(title: "Progress", hasScrolled: .constant(true)))
            .background(Image("Blob").offset(x: -100 , y: -300))
        }
    }
    
    var progressAllSections: some View {
        VStack(alignment: .leading) {
            ForEach(Array(mainViewModel.currentSections.enumerated()), id: \.offset) { index, section in
                SectionRow(section: section)
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
    }
}

struct ProgressionView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressionView()
    }
}
