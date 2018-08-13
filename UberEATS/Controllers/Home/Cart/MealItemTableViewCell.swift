//
//  MealItemTableViewCell.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/6/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import Foundation
import UIKit

class MealItemTableViewCell: UITableViewCell {
    
    var singleSelectSectinon: Bool = false {
        didSet {
            if (singleSelectSectinon) {
                selectBox.image = #imageLiteral(resourceName: "checkmark-un-round-80")
                selectBox.highlightedImage = #imageLiteral(resourceName: "checkmark-round-80")
            } else {
                selectBox.image = #imageLiteral(resourceName: "unchecked-checkbox-80")
                selectBox.highlightedImage = #imageLiteral(resourceName: "checked-checkbox-80")
            }

        }
    }
    override var isSelected: Bool {
        didSet {
            if (isSelected) {
                selectBox.isHighlighted = true
                nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
                print("isSelected")
            } else {
                selectBox.isHighlighted = false
                nameLabel.font = UIFont.systemFont(ofSize: 14)
            }
            
        }
    }
    
    var selectBox: UIImageView = {
        
        let view = UIImageView(image: #imageLiteral(resourceName: "unchecked-checkbox-80"), highlightedImage: #imageLiteral(resourceName: "checked-checkbox-80"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Crab Meat"
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "+1.03"
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
        addSubview(selectBox)
        NSLayoutConstraint.activate([
            selectBox.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            selectBox.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            selectBox.widthAnchor.constraint(equalToConstant: 25),
            selectBox.heightAnchor.constraint(equalToConstant: 25)
            ])
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            nameLabel.leftAnchor.constraint(equalTo: selectBox.rightAnchor, constant: 10),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -80),
            nameLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            priceLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 10),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            priceLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}


