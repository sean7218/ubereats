//
//  PriceRange.swift
//  UberEATS
//
//  Created by Sean Zhang on 11/30/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class PriceRange: UIView {
    
    var oneDollarButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setTitle("$", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var twoDollarButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setTitle("$$", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var threeDollarButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setTitle("$$$", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var fourDollarButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setTitle("$$$$", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
        addSubview(oneDollarButton)
        NSLayoutConstraint.activate([
            oneDollarButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            oneDollarButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            oneDollarButton.widthAnchor.constraint(equalToConstant: 150),
            oneDollarButton.heightAnchor.constraint(equalToConstant: 150)
        ])
        addSubview(twoDollarButton)
        NSLayoutConstraint.activate([
            twoDollarButton.leftAnchor.constraint(equalTo: oneDollarButton.rightAnchor, constant: 10),
            twoDollarButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            twoDollarButton.widthAnchor.constraint(equalToConstant: 150),
            twoDollarButton.heightAnchor.constraint(equalToConstant: 150)
        ])
        addSubview(threeDollarButton)
        NSLayoutConstraint.activate([
            threeDollarButton.leftAnchor.constraint(equalTo: twoDollarButton.rightAnchor, constant: 10),
            threeDollarButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            threeDollarButton.widthAnchor.constraint(equalToConstant: 150),
            threeDollarButton.heightAnchor.constraint(equalToConstant: 150)
        ])
        addSubview(fourDollarButton)
        NSLayoutConstraint.activate([
            fourDollarButton.leftAnchor.constraint(equalTo: threeDollarButton.rightAnchor, constant: 10),
            fourDollarButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            fourDollarButton.widthAnchor.constraint(equalToConstant: 150),
            fourDollarButton.heightAnchor.constraint(equalToConstant: 150)
        ])

    }
    
    
}
