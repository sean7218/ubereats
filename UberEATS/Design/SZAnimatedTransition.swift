//
//  SZAnimatedTransition.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/31/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class SZAnimatedTransition: NSObject, UIViewControllerAnimatedTransitioning {

    public let AnimatorTag = 99
    
    var duration: TimeInterval
    var isPresenting:  Bool
    var originFrame: CGRect
    var image: UIImage
    
    init(duration: TimeInterval, isPresenting: Bool, originFrame: CGRect, image: UIImage) {
        self.duration = duration
        self.isPresenting = isPresenting
        self.originFrame = originFrame
        self.image = image
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        self.isPresenting ? container.addSubview(toView) : container.insertSubview(toView, belowSubview: fromView)
        
        let detailView = isPresenting ? toView : fromView
        
        //guard let artwork = detailView.viewWithTag(AnimatorTag) as? UIImageView else { return }
        let artwork: UIImageView = UIImageView(image: #imageLiteral(resourceName: "tennesse_taco_co"))
        artwork.contentMode = .scaleAspectFit
        artwork.frame = CGRect(x: 0, y: 0, width: 375, height: 300)
        print(artwork.frame)
        artwork.alpha = 0
        
        let correctedOriginFrame = CGRect(x: originFrame.origin.x, y: originFrame.origin.y, width: originFrame.width - 20, height: originFrame.height - 20)
        let transitionImageView = UIImageView(frame: isPresenting ? correctedOriginFrame : artwork.frame)
        transitionImageView.image = image
        
        container.addSubview(transitionImageView)
        
        toView.frame = isPresenting ? CGRect(x: 0, y: fromView.frame.width, width: toView.frame.width, height: toView.frame.height) : toView.frame
        toView.alpha = isPresenting ? 0 : 1
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            //
            transitionImageView.frame = self.isPresenting ? artwork.frame : self.originFrame
            detailView.frame = self.isPresenting ? fromView.frame : CGRect(x: toView.frame.width, y: 0, width: toView.frame.width, height: toView.frame.height)
            detailView.alpha = self.isPresenting ? 1 : 0
            
        }) { (finished) in
            //
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            transitionImageView.removeFromSuperview()
            artwork.alpha = 1
        }
        
    }
}















