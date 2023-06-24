//
//  LibraryView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

struct LibraryView: View {
    @State var courseCardPressed = false
    @State var showStatusBar = true
    @State var selectedID = UUID()
    @EnvironmentObject var model: Model
    @StateObject private var mainViewModel = MainViewModel()
    
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
                .padding(.horizontal, 20)
                
                TopicsSectionView(topics: mainViewModel.topics).padding(.top)
                
                Text("Certificates".uppercased())
                    .titleStyle()
                
                CertificateView()
                    .frame(height: 220)
                    .background(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(.linearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .padding(20)
                            .offset(y: -30)
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(.linearGradient(colors: [.teal, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .padding(40)
                            .offset(y: -60)
                    )
                    .padding(20)
                
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 70)}
            .overlay(AppBar(title: "Library", hasScrolled: .constant(true)))
            .background(Image("Blob").offset(y: -300))
            
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
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
