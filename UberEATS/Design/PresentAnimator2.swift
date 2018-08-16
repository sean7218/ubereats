//
//  PresentAnimator2.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/15/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class PresentAnimator2: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        guard let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        
        // configure the toView
        toVC.view.frame = CGRect(x: 0, y: -400, width: fromVC.view.frame.width, height: 350) // 400
        
        transitionContext.containerView.addSubview(toVC.view)
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                toVC.view.frame.origin.y = 0
        },
            completion: { _ in

                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        )
    }
    
}


