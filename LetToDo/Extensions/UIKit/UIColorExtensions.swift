//
//  UIColorExtensions.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/31.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import EZSwiftExtensions

extension UIColor {
    
    
    var hexString: String {
        
        let components = self.cgColor.components
        
        let red = Float(components?[0] ?? 0)
        let green = Float(components?[1] ?? 0)
        let blue = Float(components?[2] ?? 0)
        return String(format: "%02lX%02lX%02lX", lroundf(red * 255), lroundf(green * 255), lroundf(blue * 255))
        
    }
    
    
}

