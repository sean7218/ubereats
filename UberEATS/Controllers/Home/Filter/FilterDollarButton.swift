//
//  FilterDollarButton.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/16/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class DollarButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(frame: CGRect, image: UIImage) {
        self.init(frame: frame)
        self.setImage(image, for: UIControlState.normal)
        let imageHighlight = image.alpha(0.3)?.withRenderingMode(.alwaysTemplate)
        self.setImage(imageHighlight, for: UIControlState.highlighted)
        configure()
    }
    
    convenience init(frame: CGRect, title: String) {
        self.init(frame: frame)
        self.setTitle(title, for: UIControlState.normal)
        configure()
    }
    
    func configure() {
        self.imageView?.contentMode = .scaleAspectFit
        self.contentHorizontalAlignment = .center
        self.contentVerticalAlignment = .center
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.clipsToBounds = true
        self.layer.cornerRadius = self.layer.frame.height/2
        self.setTitleColor(UIColor.black, for: UIControlState.normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public var bounds: CGRect{
        didSet{
            configure()
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if (isSelected) {
                self.backgroundColor = .black
                self.setTitleColor(UIColor.white, for: UIControlState.selected)
            } else {
                self.backgroundColor = .white
                self.setTitleColor(UIColor.black, for: UIControlState.normal)
            }
        }
    }
}
