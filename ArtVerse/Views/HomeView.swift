//
//  HomeView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/3/23.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    
    var body: some View {
        ScrollView {
            GeometryReader{ proxy in
                Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
            }.frame(height: 0)
            
            FeaturedItem()
            Color.clear.frame(height:500)
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScrollPreferenceKey.self, perform: {value in
            withAnimation (.easeInOut){
                if value < 0{
                    hasScrolled = true
                }else{
                    hasScrolled = false
                }
            }
        })
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay(AppBar(title: "Featured", hasScrolled: $hasScrolled))
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
