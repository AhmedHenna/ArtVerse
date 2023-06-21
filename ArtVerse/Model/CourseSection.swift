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
    var videoLink: String
    var progress: CGFloat
}
