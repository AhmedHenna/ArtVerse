//
//  Course.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/6/23.
//

import SwiftUI

struct Course: Identifiable{
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var logo: String
    var height: CGFloat
}

var courses = [
    Course(title: "Blender Beginner Tutorial", subtitle: "17 Sections - 7 Hours", text: "Blender tutorial series showing you how to use the most common features, like modelling, lighting, materials, geometry nodes and rendering - whilst making a donut.", image: "Illustration 5", logo: "Blender", height: 250),
    Course(title: "Photoshop for Beginners", subtitle: "5 Sections - 4 Hours", text: "If you want to be a pro digital artist, you may want to learn photoshop. In this hand holdy real time tutorial, I will teach you the most essential things you will need to get started with Photoshop.", image: "Illustration 1", logo: "Photoshop", height: 230),
    Course(title: "Procreate Beginners Series", subtitle: "4 Sections - 1 Hours", text: "The Beginners Series is a four-part guide to Procreate, the award-winning digital art app for iPad. Ideal for people new to Procreate, and with plenty of extra tips for advanced artists.", image: "Illustration 12", logo: "Procreate", height: 210)
]

