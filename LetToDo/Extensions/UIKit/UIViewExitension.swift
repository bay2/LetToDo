//
//  UIViewExitension.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/14.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

fileprivate var rediusKey: UInt8 = 0
@IBDesignable extension UIView {
    
    @IBInspectable var redius: CGFloat {
        
        get {
            return associatedObject(base: self, key: &rediusKey) {
                return 0.0
            }
        }
        
        set {
            
            associatedObject(base: self, key: &rediusKey, value: newValue)
            self.layer.cornerRadius = newValue;
        }
        
    }
    
}
