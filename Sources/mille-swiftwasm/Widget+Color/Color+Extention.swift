//
//  Color+Extension.swift
//  
//
//  Created by MacBook Pro M1 on 2023/03/20.
//

import TokamakDOM


// MARK: - Color extension
extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}
