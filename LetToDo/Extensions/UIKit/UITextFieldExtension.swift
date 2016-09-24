//
//  UITextFieldExtension.swift
//  LetToDo
//
//  Created by xuemincai on 16/9/16.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setPlaceholderColor(_ color: UIColor) {
        
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSForegroundColorAttributeName: color])
    }
        
}
