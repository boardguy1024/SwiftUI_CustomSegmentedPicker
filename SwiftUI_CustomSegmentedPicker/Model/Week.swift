//
//  Week.swift
//  SwiftUI_CustomSegmentedPicker
//
//  Created by park kyung seok on 2021/11/19.
//

import Foundation

struct Week: Identifiable {
    
    let id = UUID().uuidString
    let day: String
    let date: String
    let amountSpent: Double
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
