//
//  ZoomTransitioning.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/30.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

class ZoomTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    enum TransitionType {
        case Present
        case Dismiss
        
    }
    
    var zoomView: UIView
    
    var transitionType: TransitionType = .Present
    
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
        
        guard let formVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        
        var finalFrame = CGRect.zero
        var startFrame = CGRect.zero
        
        if transitionType == .Present {
            
            finalFrame = transitionContext.finalFrame(for: toVC)
            startFrame = self.zoomView.convert(self.zoomView.frame, to: formVC.view)
            
            toVC.view.frame = startFrame
            toVC.view.alpha = 0
            
            
            let containerView = transitionContext.containerView
            
            containerView.addSubview(toVC.view)
            
            let duration = self.transitionDuration(using: transitionContext)
            
            
            UIView.animate(withDuration: duration, animations: {
                
                toVC.view.alpha = 1
                toVC.view.frame = finalFrame
                
            }, completion: { _ in
                
                transitionContext.completeTransition(true)
                
            })
            
            
            
        } else {
            
            let containerView = transitionContext.containerView
            
            finalFrame = self.zoomView.convert(self.zoomView.frame, to: formVC.view)
            startFrame = transitionContext.finalFrame(for: toVC)
            
            containerView.addSubview(toVC.view)
            containerView.addSubview(formVC.view)
            
            toVC.view.alpha = 0
            
            let duration = self.transitionDuration(using: transitionContext)
            
            UIView.animate(withDuration: duration, animations: {
                
                formVC.view.alpha = 0
                formVC.view.frame = finalFrame
                toVC.view.alpha = 1
                
            }, completion: { _ in
                
                transitionContext.completeTransition(true)
                
            })
            
            
        }
        
        
        
        
    }

}
