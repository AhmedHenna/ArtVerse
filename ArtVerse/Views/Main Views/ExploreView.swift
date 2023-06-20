//
//  ExploreView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//


import SwiftUI

struct ExploreView: View {
    @StateObject private var mainViewModel = MainViewModel()

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                coursesSection
                
                Text("Topics".uppercased())
                    .titleStyle()
                
                topicsSection
                
                Text("Popular".uppercased())
                    .titleStyle()
                
                handbooksSection
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 70)
            }
            .overlay(AppBar(title: "Recent", hasScrolled: .constant(true)))
            .background(Image("Blob").offset(x: -100, y: -400))
        }
    }
    
    var coursesSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(mainViewModel.courses) { course in
                    SmallCourseItem(course: course)
                }
            }
            .padding(.horizontal, 20)
            Spacer()
        }
    }
    
    var handbooksSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(handbooks) { handbook in
                    HandbookItem(handbook: handbook)
                }
            }
            .frame(height: 330)
            .padding(.horizontal, 20)
        }
    }

    
    var topicsSection: some View {
        VStack {
            ForEach(mainViewModel.topics) { topic in
                ListRow(topic: topic)
            }
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(.horizontal, 20)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
