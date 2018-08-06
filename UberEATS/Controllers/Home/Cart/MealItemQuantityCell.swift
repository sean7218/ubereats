//
//  MealItemQuantityCell.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/6/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import Foundation
import UIKit

class MealItemQuantityCell: UITableViewCell {
    
    var increaseButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "button-plus"), for: UIControlState.normal)
        return button
    }()
    
    var decreaseButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "button-minus"), for: UIControlState.normal)
        return button
    }()
    
    var quantityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        label.text = "1"
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        addSubview(quantityLabel)
        NSLayoutConstraint.activate([
            quantityLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            quantityLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            quantityLabel.widthAnchor.constraint(equalToConstant: 40),
            quantityLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
        addSubview(increaseButton)
        NSLayoutConstraint.activate([
            increaseButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            increaseButton.leftAnchor.constraint(equalTo: quantityLabel.rightAnchor, constant: 0),
            increaseButton.widthAnchor.constraint(equalToConstant: 40),
            increaseButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        addSubview(decreaseButton)
        NSLayoutConstraint.activate([
            decreaseButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            decreaseButton.rightAnchor.constraint(equalTo: quantityLabel.leftAnchor, constant: 0),
            decreaseButton.widthAnchor.constraint(equalToConstant: 40),
            decreaseButton.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
}
