//
//  HomeGroupCollectionViewCell.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/4.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import IBAnimatable
import RandomColor
import RxSwift
import RxCocoa
import EZSwiftExtensions

class HomeGroupCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var displayView: UIView!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var mainView: AnimatableView!
    @IBOutlet weak var groupTitle: UILabel!
    
    
    fileprivate var doubleTap = UITapGestureRecognizer()
    fileprivate var disposebag = DisposeBag()
    private var transformAinmate: ZoomTransitioning!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        transformAinmate = ZoomTransitioning(zoomView: mainView);
        
        groupTitle.textColor = randomColor(hue: .random, luminosity: .bright)


        editView.addGestureRecognizer(doubleTap)
        doubleTap.numberOfTapsRequired = 2
        
        // MARK: 模式切换
        do {
            
            let switchAnimate = { [unowned self] in
                
                self.editView.isHidden = !self.editView.isHidden
                self.displayView.isHidden = !self.displayView.isHidden
                
                self.mainView.animate()
            }
            
            doubleTap.rx
                .event
                .map{ _ -> Void in return }
                .bindNext(switchAnimate)
                .addDisposableTo(disposebag)
            
            moreBtn.rx.tap
                .bindNext(switchAnimate)
                .addDisposableTo(disposebag)
            
            
        }
        
        
        // MARK: 点击编辑
//        do {
//            
//            editBtn.rx
//                .tap
//                .bindNext { 
//                    
//                    let vc = StoryboardScene.Home.instantiateEditGroupViewController()
//                    vc.transitioningDelegate = self
//                    ez.topMostVC?.presentVC(vc)
//                    
//                }
//                .addDisposableTo(disposebag)
//            
//        }
        
    }

}

//extension HomeGroupViewController: UIViewControllerTransitioningDelegate {
//    
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return self.transformAinmate
//    }
//    
//}
