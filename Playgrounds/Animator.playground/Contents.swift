//: Playground - noun: a place where people can play

import Foundation
import UIKit
import XCPlayground

var str = "Hello, playground"

class ExpandAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    static var animator = ExpandAnimator()
    
    enum ExpandTransitionMode: Int {
        case Present, Dismiss
    }
    
    let presentDuration = 0.4
    let dismissDuration = 0.15
    
    var openingFrame: CGRect?
    var transitionMode: ExpandTransitionMode = .Present
    
    var topView: UIView!
    var bottomView: UIView!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return (transitionMode == .Present) ? presentDuration : dismissDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // From view controller
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let fromViewFrame = fromViewController.view.frame
        
        // To view controller
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        
        // Container view
        let containerView = transitionContext.containerView
        
        if (transitionMode == .Present) {
            
            // Get top view using resizableSnapshotViewFromRect
            topView = fromViewController.view.resizableSnapshotView(from: fromViewFrame,
                                                                    afterScreenUpdates: true,
                                                                    withCapInsets: UIEdgeInsets(top: openingFrame!.origin.y, left: 0, bottom: 0, right: 0))
            topView.frame = CGRect(x: 0, y: 0, width: fromViewFrame.width, height: openingFrame!.origin.y)
            
            // Add top view to container
            containerView.addSubview(topView)
            
            // Get bottom view using resizableSnapshotViewFromRect
            bottomView = fromViewController.view.resizableSnapshotView(from: fromViewFrame,
                                                                       afterScreenUpdates: true,
                                                                       withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: (fromViewFrame.height - openingFrame!.origin.y - openingFrame!.height), right: 0))
            bottomView.frame = CGRect(x: 0, y: openingFrame!.origin.y + openingFrame!.height,
                                      width: fromViewFrame.width,
                                      height: fromViewFrame.height - openingFrame!.origin.y - openingFrame!.height)
            
            // Take a snapshot of the to view controller and change its frome to opening frame
            let snapshotView = toViewController.view.resizableSnapshotView(from: fromViewFrame,
                                                                           afterScreenUpdates: true,
                                                                           withCapInsets: UIEdgeInsets.zero)!
            snapshotView.frame = openingFrame!
            containerView.addSubview(snapshotView)
            
            toViewController.view.alpha = 0.0
            containerView.addSubview(toViewController.view)
            
            UIView.animate(withDuration: presentDuration, animations: { () -> Void in
                // Move top and bottom views out of the screen
                self.topView.frame = CGRect(x: 0, y: -self.topView.frame.height, width: self.topView.frame.width, height: self.topView.frame.height)
                self.bottomView.frame = CGRect(x: 0, y: fromViewFrame.height, width: self.bottomView.frame.width, height: self.bottomView.frame.height)
                
                // Expand snapshot view to fill entire frame
                snapshotView.frame = toViewController.view.frame
                
            }) { (finished) in
                // Remove snapshot view from container view
                snapshotView.removeFromSuperview()
                
                // Make to view controller visible
                toViewController.view.alpha = 1.0
                
                // Complete transition
                transitionContext.completeTransition(finished)
            }
            
        } else {
            // dismiss viewController
            let snapshotView = fromViewController.view.resizableSnapshotView(from: fromViewController.view.bounds, afterScreenUpdates: true, withCapInsets: UIEdgeInsets.zero)!
            containerView.addSubview(snapshotView)
            
            //
            fromViewController.view.alpha = 0.0
            
            UIView.animate(withDuration: dismissDuration, animations: { () -> Void in
                // Move top and bottom view into the screen
                self.topView.frame = CGRect(x: 0, y: 0,
                                            width: self.topView.frame.width, height: self.topView.frame.height)
                self.bottomView.frame = CGRect(x: 0, y: fromViewFrame.height - self.bottomView.frame.height,
                                               width: self.bottomView.frame.width, height: self.bottomView.frame.height)
                snapshotView.frame = self.openingFrame!
                
            }) { (finished) in
                
                snapshotView.removeFromSuperview()
                toViewController.view.alpha = 1.0
                transitionContext.completeTransition(finished)
            }
        }
    }
}

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIViewControllerTransitioningDelegate {
    
    var openingFrame: CGRect?
    
    let cellColors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.brown, UIColor.cyan, UIColor.lightGray]
    
    
    override func viewDidLoad() {
        // initial setup
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! UICollectionViewCell
        cell.backgroundColor = cellColors[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let presentationAnimator = ExpandAnimator.animator
        presentationAnimator.openingFrame = openingFrame!
        presentationAnimator.transitionMode = .Present
        return presentationAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let presentationAnimator = ExpandAnimator.animator
        presentationAnimator.openingFrame = openingFrame!
        presentationAnimator.transitionMode = .Dismiss
        return presentationAnimator
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // set frame of cell
        let attributes = collectionView.layoutAttributesForItem(at: indexPath)
        let attributesFrame = attributes?.frame
        let frameToOpenFrom = collectionView.convert(attributesFrame, to: collectionView.superview)
        openingFrame = frameToOpenFrom
        
        // present view controller
        let expandedVC = ExpandedViewController()
        expandedVC.transitioningDelegate = self
        expandedVC.modalPresentationStyle = .custom
        expandedVC.view.backgroundColor = cellColors[indexPath.row]
        present(expandedVC, animated: true, completion: nil)
        
        
    }
}

class ExpandedViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        var tapGesture = UITapGestureRecognizer(target: self, action: "handleTap")
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func handleTap() {
        self.dismiss(animated: true, completion: nil)
    }
}
