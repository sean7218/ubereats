//
//  InfoAnimatedTransition.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/2/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import Foundation
import UIKit

class InfoAnimatedTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    var duration: TimeInterval
    var isPresenting:  Bool

    
    init(duration: TimeInterval, isPresenting: Bool) {
        self.duration = duration
        self.isPresenting = isPresenting
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        if (isPresenting) {
            
            container.addSubview(toView)
            
            let navBarFrame = fromVC.navigationController!.navigationBar.frame
            fromVC.navigationController!.navigationBar.frame = CGRect(x: 0, y: (navBarFrame.height), width: navBarFrame.width, height: navBarFrame.height)
            let tabBarFrame = fromVC.tabBarController!.tabBar.frame
            fromVC.tabBarController?.tabBar.frame = CGRect(x: 0, y: tabBarFrame.origin.y, width: tabBarFrame.width, height: tabBarFrame.height)
            
            UIView.animate(withDuration: duration, animations: {
                
                let toViewFrame = toView.frame
                toView.frame = CGRect(x: toViewFrame.origin.x, y: toViewFrame.origin.y - 44,
                                      width: toViewFrame.width, height: (toViewFrame.height + tabBarFrame.height))

            }) { (finished) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        } else {
            
            container.addSubview(toView)
            
            let navBarFrame = fromVC.navigationController!.navigationBar.frame
            fromVC.navigationController!.navigationBar.frame = CGRect(x: 0, y: -(navBarFrame.height), width: navBarFrame.width, height: navBarFrame.height)
            let tabBarFrame = fromVC.tabBarController!.tabBar.frame
            fromVC.tabBarController?.tabBar.frame = CGRect(x: 0, y: tabBarFrame.origin.y, width: tabBarFrame.width, height: tabBarFrame.height)
            
            UIView.animate(withDuration: duration, animations: {
                
                let toViewFrame = toView.frame
                toView.frame = CGRect(x: toViewFrame.origin.x, y: toViewFrame.origin.y,
                                      width: toViewFrame.width, height: (toViewFrame.height + tabBarFrame.height - 44
                ))
                
            }) { (finished) in
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                
                
            }
        }
        
        
    }
}
