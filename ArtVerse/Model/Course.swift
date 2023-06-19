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
    var description: String
    var image: String
    var logo: String
    var bg: String
    var height: CGFloat
}
