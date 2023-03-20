//
//  Appearance.swift
//  
//
//  Created by MacBook Pro M1 on 2023/03/20.
//

import TokamakDOM

// MARK: -
enum Appearance: CaseIterable {
    case light
    case dark
    
    var foregroundColor: Color {
        switch self {
        case .light:
            return .black
        case .dark:
            return .white
        }
    }
    
    var widgetColor: Color {
        switch self {
        case .light:
            return .white
        case .dark:
            return Color(0x1c1c1e)
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .light:
            return Color(0xf2f2f7)
        case .dark:
            return .black
        }
    }
}
