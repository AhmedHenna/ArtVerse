//
//  Suggestions.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/11/23.
//

import SwiftUI

struct Suggestions: Identifiable{
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestions(text: "Blender"),
    Suggestions(text: "Photoshop"),
    Suggestions(text: "Procreate")
]
