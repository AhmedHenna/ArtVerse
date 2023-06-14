//
//  Handbook.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI


struct Handbook: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var description: String
    var logo: String
    var image: String
    var color1: Color
    var color2: Color
}

var handbooks = [
    Handbook(title: "Blender Handbook", subtitle: "17 Sections - 7 Hours", description: "Blender tutorial series showing you how to use the most common features, like modelling, lighting, materials, geometry nodes and rendering - whilst making a donut.", logo: "Blender", image: "Illustration 5", color1: .teal, color2: .blue),
    Handbook(title: "Photoshop Handbook", subtitle: "5 Sections - 4 Hours", description: "If you want to be a pro digital artist, you may want to learn photoshop. In this hand holdy real time tutorial, I will teach you the most essential things you will need to get started with Photoshop.", logo: "Photoshop", image: "Illustration 1", color1: .purple, color2: .pink)
]
