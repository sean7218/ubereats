//
//  SlideAnimator.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/30/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class SlideAnimation: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    let duration = 0.5
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else {
            return
        }
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else {
            return
        }
        let container = transitionContext.containerView
        let screenOffUp = CGAffineTransform(translationX: 0, y: -container.frame.height)
        let screenOffDown = CGAffineTransform(translationX: 0, y: container.frame.height)
        toView.transform = screenOffUp
        UIView.animate(withDuration: duration, delay: 0.00, options: UIViewAnimationOptions.allowUserInteraction, animations: {
            fromView.transform = screenOffDown
            fromView.alpha = 0.5
            toView.transform = CGAffineTransform.identity
            toView.alpha = 1
        }) { (success) in
            transitionContext.completeTransition(success)
        }
    }
}
