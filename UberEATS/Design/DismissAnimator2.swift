//
//  DismissAnimator2.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/15/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class DismissAnimator2 : NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        
        
        let screenBounds = UIScreen.main.bounds
        let finalFrame = CGRect(x: 0, y: -400, width: screenBounds.width, height: 400)
        
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
