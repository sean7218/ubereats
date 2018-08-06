//
//  MealItemTitleCell.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/6/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class MealItemTitleCell: UITableViewCell {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "The Classic Quesadilla"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    var seperator: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor.black
        return line
    }()
    
    var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "598-848 Cal. Jack cheese and your choice of chicken, steak, pork carnitas, taco beef, fish or farm-fresh veggies, and beans. served with sour cream and salsa. 133 Cal."
        label.numberOfLines = 4
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = NSTextAlignment.center
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
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 100)
            ])
        addSubview(seperator)
        NSLayoutConstraint.activate([
            seperator.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            seperator.centerXAnchor.constraint(equalTo: centerXAnchor),
            seperator.widthAnchor.constraint(equalToConstant: 100),
            seperator.heightAnchor.constraint(equalToConstant: 1)
            ])
        addSubview(detailLabel)
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: seperator.bottomAnchor, constant: 10),
            detailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            detailLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            detailLabel.heightAnchor.constraint(equalToConstant: 100)
            ])
    }
}
