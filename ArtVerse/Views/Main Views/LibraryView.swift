//
//  LibraryView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

struct LibraryView: View {
    @StateObject private var mainViewModel = MainViewModel()

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
            
                coursesViewdPreviously
                
                topicsSection.padding(.top)
                
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
                Color.clear.frame(height: 70)
            }
            .overlay(AppBar(title: "Library", hasScrolled: .constant(true)))
            .background(Image("Blob").offset(y: -300))
        }
    }
    
    var coursesViewdPreviously: some View {
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

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
