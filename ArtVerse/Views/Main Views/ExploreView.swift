//
//  ExploreView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//


import SwiftUI

struct ExploreView: View {
    @State var courseCardPressed = false
    @State var showStatusBar = true
    @State var selectedID = UUID()
    @EnvironmentObject var model: Model
    @StateObject private var mainViewModel = MainViewModel()
    @StateObject private var exploreViewModel = ExploreViewModel()
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20) {
                    if !courseCardPressed{
                        CourseHorizontalView(courses: mainViewModel.courses, courseCardPressed: $courseCardPressed,
                                             showStatusBar: $showStatusBar, selectedID: $selectedID, model: _model)
                    }else{
                        CardFiller(courses: mainViewModel.courses)
                    }
                }
                
                Text("Topics".uppercased())
                    .titleStyle()
                
                TopicsSectionView(topics: mainViewModel.topics)
                
                Text("Popular".uppercased())
                    .titleStyle()
                
                handbooksSection
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 70)}
            .overlay(AppBar(title: "Recent", hasScrolled: .constant(true)))
            .background(Image("Blob").offset(x: -100, y: -400))
            
            if courseCardPressed{
                CourseCardDetails(courses: mainViewModel.courses, selectedID: selectedID, courseCardPressed: $courseCardPressed)
            }
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: courseCardPressed){ newValue in
            withAnimation(.closeCard){
                if newValue{
                    showStatusBar = false
                }else{
                    showStatusBar = true
                }
            }
        }
    }
    
    var handbooksSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(exploreViewModel.handbooks) { handbook in
                    HandbookItem(handbook: handbook)
                }
            }
            .frame(height: 330)
            .padding(.horizontal, 20)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
