//
//  PresentAnimator.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/3/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class PresentAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    

    var startFrame: CGRect
    
    init(startFrame: CGRect) {
        self.startFrame = startFrame
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        guard let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        
        transitionContext.containerView.insertSubview(toVC.view, aboveSubview: fromVC.view)
        
        // Start Frame
        toVC.view.frame = startFrame
        
        // Final Frame
        let screenBounds = UIScreen.main.bounds
        let topLeftCorner = CGPoint(x: 0, y: 0)
        let finalFrame = CGRect(origin: topLeftCorner, size: screenBounds.size)
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                fromVC.view.frame = finalFrame
        },
            completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        )
    }
    
}

