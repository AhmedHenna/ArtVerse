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
