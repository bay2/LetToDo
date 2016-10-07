//
//  HomeGroupCollectionViewCell.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/4.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import IBAnimatable

class HomeGroupCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var moreBtn: UIButton!
    
    // 编辑模式
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var centerLineView: AnimatableView!
    @IBOutlet weak var editBottomView: AnimatableView!
    @IBOutlet weak var editTopView: AnimatableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    @IBAction func tap(_ sender: AnyObject) {
        
        editView.isHidden = false
        
        editTopView.animationType = .slide(way: .in, direction: .down)
        editTopView.delay = 0.6
        
        editBottomView.animationType = .slide(way: .in, direction: .up)
        editBottomView.delay = 0.6
        
        centerLineView.animationType = .zoomInvert(way: .in)
        centerLineView.delay = 0.3
        
        centerLineView.animate()
        editBottomView.animate()
        editTopView.animate()
        
    }
}
