//
//  CourseSection.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

struct CourseSection: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var description: String
    var image: String
    var background: String
    var logo: String
    var progress: CGFloat
}

var courseSections = [
    CourseSection(title: "Getting Started", subtitle: "Blender Beginner Tutorial", description: "Blender tutorial series showing you how to use the most common features, like modelling, lighting, materials, geometry nodes and rendering - whilst making a donut.", image: "Illustration 5", background: "Background 4", logo: "Blender", progress: 0.5),
    CourseSection(title: "Getting Started", subtitle: "Blender Beginner Tutorial", description: "Blender tutorial series showing you how to use the most common features, like modelling, lighting, materials, geometry nodes and rendering - whilst making a donut.", image: "Illustration 5", background: "Background 4", logo: "Blender", progress: 0.5),
    CourseSection(title: "Getting Started", subtitle: "Blender Beginner Tutorial", description: "Blender tutorial series showing you how to use the most common features, like modelling, lighting, materials, geometry nodes and rendering - whilst making a donut.", image: "Illustration 5", background: "Background 4", logo: "Blender", progress: 0.5),
]
