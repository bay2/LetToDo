//
//  UIStyle.swift
//  LetToDo
//
//  Created by xuemincai on 2016/9/23.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import EZSwiftExtensions


/// 配置Nav bar 样式
protocol NavigationBarStyle {
    func configNavigationBar()
}

extension NavigationBarStyle where Self: UIViewController {
    
    /// 配置 Nav Bar
    func configNavigationBar() {
        
        let backgroundImage = UIImage.imageWithColor(imageWithColor: UIColor(named: .navBarBackground), size: CGSize(width: ez.screenWidth, height: 64))
        
        self.navigationController?.navigationBar.setBackgroundImage(backgroundImage, for: .any, barMetrics: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(imageWithColor: UIColor(named: .navBarBackground), size: CGSize(width: ez.screenWidth, height: 1))
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    
}

extension UIViewController: NavigationBarStyle { }


