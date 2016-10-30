//
//  ZoomTransitioning.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/30.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

class ZoomTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    var zoomView: UIView
    
    init(zoomView: UIView) {
        
        self.zoomView = zoomView
        
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        let finalFrame = transitionContext.finalFrame(for: toVC)
        
        toVC.view.frame = self.zoomView.frame
        
        let containerView = transitionContext.containerView
        
        containerView.addSubview(toVC.view)
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, animations: {
            
            toVC.view.frame = finalFrame
        
        }, completion: { _ in
            
            transitionContext.completeTransition(true)
        
        })
        
        
    }

}
