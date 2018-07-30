//
//  SectionHeaderView.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/28/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionViewCell {
    
    var title: String {
        didSet {
            titleLabel.text = title
        }
    }
    
    var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.black
        return label
    }()
    
    override init(frame: CGRect) {
        title = ""
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
}
