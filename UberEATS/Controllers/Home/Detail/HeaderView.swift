//
//  HeaderView.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/27/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    var name: String?
    var cuisine: String?
    var time: String?
    var fee: String?
    var stars: String?
    var review: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
