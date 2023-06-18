//
//  ArtVerseApp.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 5/30/23.
//

import SwiftUI
import Firebase

@main
struct ArtVerseApp: App {
    @StateObject var model = Model()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
