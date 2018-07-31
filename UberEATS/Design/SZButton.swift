//
//  SZButton.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/30/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class SZButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func jitter()
    {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 6
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint.init(x: self.center.x - 7.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint.init(x: self.center.x, y: self.center.y))
        layer.add(animation, forKey: "position")
    }
}
