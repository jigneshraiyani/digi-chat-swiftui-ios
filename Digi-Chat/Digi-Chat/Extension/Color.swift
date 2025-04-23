//
//  Color.swift
//  Digi-Chat
//
//  Created by Raiyani Jignesh on 11/30/24.
//

import Foundation
import SwiftUI

// MARK: - Color Extension

extension Color {
    static let theme = ColorTheme()
}

// MARK: - ColorTheme

struct ColorTheme {
    let accentColor = Color(Constant.Color.accentColor)
    let backgroundColor = Color(Constant.Color.backgroundColor)
    let greenColor = Color(Constant.Color.greenColor)
    let redColor = Color(Constant.Color.redColor)
    let secondaryTextColor = Color(Constant.Color.secondaryTextColor)
}

// MARK: - Color Constant

struct Constant {
    struct Color {
        static let accentColor = "AccentColor"
        static let backgroundColor = "BackgroundColor"
        static let greenColor = "GreenColor"
        static let redColor = "RedColor"
        static let secondaryTextColor = "SecondaryTextColor"
    }
}
