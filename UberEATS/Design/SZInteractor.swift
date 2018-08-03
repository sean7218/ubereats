//
//  SZInteractor.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/1/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class SZInteractor: UIPercentDrivenInteractiveTransition {
    
    var navigationController: UINavigationController
    var modalViewController: UIViewController
    var shouldCompleteTransition: Bool = false
    var transitionInProgress: Bool = false
    
    init?(attachTo viewController: UIViewController) {
        if let nav = viewController.navigationController {
            self.navigationController = nav
            modalViewController = UIViewController() // just for init purpose
            super.init()
            setupBackGesture(view: viewController.view)
        } else {
            return nil
        }
    }
    
    init(attachWith modalViewController: UIViewController) {
        self.modalViewController = modalViewController
        navigationController = UINavigationController() // just for init purpose
        super.init()
    }
    
    private func setupBackGesture(view: UIView){
        let swipeBackGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleBackGesture(_:)))
        swipeBackGesture.edges = .left
        view.addGestureRecognizer(swipeBackGesture)
        
    }
    
    @objc func handleBackGesture(_ gesture: UIScreenEdgePanGestureRecognizer){
        let viewTranslation = gesture.translation(in: gesture.view?.superview)
        let progress = viewTranslation.x / 300
        switch gesture.state {
        case .began:
            //
            transitionInProgress = true
            modalViewController.dismiss(animated: true, completion: nil)
            break;
        case .changed:
            //
            shouldCompleteTransition = progress > 0.5
            update(progress)
            break;
        case .cancelled:
            //
            transitionInProgress = false
            cancel()
            break;
        case .ended:
            //
            transitionInProgress = false
            shouldCompleteTransition ? finish() : cancel()
            break;
        default:
            return
        }
    }
    
}
