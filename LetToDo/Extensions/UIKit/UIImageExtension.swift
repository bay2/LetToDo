//
//  UIImageExtension.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/4.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

extension UIImage {
    
    
    /// 生成纯色图片
    ///
    /// - parameter color: 颜色
    /// - parameter size:  图片大小
    ///
    /// - returns: Image
    static func imageWithColor(imageWithColor color: UIColor, size: CGSize) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(origin: CGPoint(x: 0, y: 0), size: size))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return colorImage
        
    }
    
}
