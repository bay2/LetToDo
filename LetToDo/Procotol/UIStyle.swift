//
//  UIStyle.swift
//  LetToDo
//
//  Created by xuemincai on 2016/9/23.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit


/// TODO 输入框样式
protocol ToDoInputTextFieldStyle {
    func configToDoInputStyle()
}

extension ToDoInputTextFieldStyle where Self: UITextField {
    
    
    /// TODO 输入样式
    func configToDoInputStyle() {
        
        self.setPlaceholderColor(UIColor(named: .addToDoPlaceholderColor))
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                             attributes: [NSForegroundColorAttributeName: UIColor(named: .addToDoPlaceholderColor),
                                                                          NSFontAttributeName: UIFont.italicSystemFont(ofSize: 14)]);
        
    }
    
}

extension  UITextField: ToDoInputTextFieldStyle { }



