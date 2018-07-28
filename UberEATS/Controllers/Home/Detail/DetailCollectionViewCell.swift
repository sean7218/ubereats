//
//  DetailCollectionViewCell.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/28/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "Debos Remedy"
        return label
    }()
    var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.italicSystemFont(ofSize: 11)
        label.text = "Carrot, beet, cucumber, romaine, lemon, genger, and cayenne pepper. Certified Organic. 16 oz bottle"
        return label
    }()
    var dollarLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.italicSystemFont(ofSize: 11)
        label.text = "$11.00"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 3),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -3),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        addSubview(infoLabel)
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            infoLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 3),
            infoLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -3),
            infoLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        addSubview(dollarLabel)
        NSLayoutConstraint.activate([
            dollarLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 5),
            dollarLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 3),
            dollarLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -3),
            dollarLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
    }
}
