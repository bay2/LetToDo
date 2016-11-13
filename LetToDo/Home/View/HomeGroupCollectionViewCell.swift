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
    @IBOutlet weak var itemLab: UILabel!
    
    var groupID: String!
    
    fileprivate var doubleTap = UITapGestureRecognizer()
    fileprivate var disposebag = DisposeBag()
    var transformAinmate: ZoomTransitioning!
    
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
        do {
            
            editBtn.rx
                .tap
                .bindNext { 
                    
                    let nav = StoryboardScene.Home.instantiateEditGroupViewNavController()
                    nav.transitioningDelegate = self
                    
                    guard let vc = nav.topViewController as? EditGroupViewController else {
                        return
                    }
                    
                    vc.groupTitle = self.groupTitle.text
                    vc.groupID = self.groupID
                    
                    ez.topMostVC?.presentVC(nav)
                    
                }
                .addDisposableTo(disposebag)
            
        }
        
    }

}

extension HomeGroupCollectionViewCell: UIViewControllerTransitioningDelegate {
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transformAinmate.transitionType = .Present
        return transformAinmate
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transformAinmate.transitionType = .Dismiss
        return transformAinmate
    }
    
}

