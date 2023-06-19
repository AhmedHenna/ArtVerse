//
//  ColorFromString.swift
//  ArtVerse
//
//  Created by Ahmed Henna on 6/19/23.
//

import SwiftUI

func colorFromString(_ colorString: String) -> Color? {
    switch colorString {
    case "blue":
        return Color.blue
    case "red":
        return Color.red
    case "green":
        return Color.green
    case "cyan":
        return Color.cyan
    case "purple":
        return Color.purple
    case "pink":
        return Color.pink
    case "teal":
        return Color.teal
    default:
        return nil
    }
}
