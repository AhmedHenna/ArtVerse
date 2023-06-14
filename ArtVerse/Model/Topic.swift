//
//  Topic.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/14/23.
//

import SwiftUI

struct Topic: Identifiable {
    let id = UUID()
    var title: String
    var icon: String
}

var topics = [
    Topic(title: "3D Art", icon: "scale.3d"),
    Topic(title: "Digital Art", icon: "ipad.landscape"),
    Topic(title: "Traditional Art", icon: "pencil.line")
]
