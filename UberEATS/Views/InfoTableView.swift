//
//  InfoTableView.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/30/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class InfoTableView: UITableView {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        backgroundColor = .red

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
