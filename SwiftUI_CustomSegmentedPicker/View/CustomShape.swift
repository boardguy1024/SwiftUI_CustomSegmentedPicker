//
//  CustomShape.swift
//  SwiftUI_CustomSegmentedPicker
//
//  Created by park kyung seok on 2021/11/18.
//

import SwiftUI

struct CustomShape: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
    
 
}
  
