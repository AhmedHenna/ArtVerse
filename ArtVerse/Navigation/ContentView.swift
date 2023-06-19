//
//  ContentView.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 5/30/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @AppStorage("showModal") var showModal = false
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .home:
                HomeView()
            case .explore:
                ExploreView()
            case .progress:
                NotificationsView()
            case .library:
                LibraryView()
            }
            TabBar()
                .offset(y: model.showDetail ? 200 : 0)
            
            if showModal{
                ModalView()
                    .zIndex(1)
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Color.clear.frame(height:90)
        }
        .dynamicTypeSize(.large ... .xxLarge)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model())
    }
}

