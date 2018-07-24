//
//  SortCell.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/23/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class SortView: UICollectionViewCell {
    
    let sortView: SortCellView = {
        let view = SortCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // backgroundColor = UIColor.cyan
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        addSubview(sortView)
        NSLayoutConstraint.activate([
            sortView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            sortView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            sortView.widthAnchor.constraint(equalTo: widthAnchor),
            sortView.heightAnchor.constraint(equalTo: heightAnchor)
            ])
    }
}
