//
//  ArtVerseApp.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 5/30/23.
//

import SwiftUI

@main
struct ArtVerseApp: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
