//
//  Animations.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/7/23.
//

import SwiftUI

extension Animation {
    static let openCard = Animation.spring(response: 0.6, dampingFraction: 0.8)
    static let closeCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
}
