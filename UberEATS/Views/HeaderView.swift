//
//  HeaderView.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/27/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class HeaderView: UIView, HeaderViewDelegate {
    
    func updateHeaderViewLabelOpacity(constant: CGFloat) {
    }
    
    func updateHeaderViewLabelSize(constant: CGFloat) {
        let pec = 1 + (constant+44)/80
        let opacityPec = 1 - (constant+44)/147
        nameLabelTopAnchorConstraint?.constant = 10 * (pec)
        nameLabelLeftAnchorConstraint?.constant = 15 * (pec)
        nameLabelRightAnchorConstraint?.constant = -15 * (pec)
        
        costLabelLeftAnchorConstraint?.constant = 15 * (pec)
        costLabelRightAnchorConstraint?.constant = -15 * (pec)
        costLabel.layer.opacity = Float(opacityPec)
        
        cuisineLabelLeftAnchorConstraint?.constant = 15 * (pec)
        cuisineLabelRightAnchorConstraint?.constant = -15 * (pec)
        cuisineLabel.layer.opacity = Float(opacityPec)
    }
    
    var name: String?
    var cuisine: String?
    var time: String?
    var fee: String?
    var stars: String?
    var review: String?
    
    var nameLabelTopAnchorConstraint: NSLayoutConstraint?
    var nameLabelLeftAnchorConstraint: NSLayoutConstraint?
    var nameLabelRightAnchorConstraint: NSLayoutConstraint?
    var nameLabelHeightAnchorConstraint: NSLayoutConstraint?
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        label.numberOfLines = 2
        label.text = "Tennesse Taco Company"
        return label
    }()
    

    var cuisineLabelTopAnchorConstraint: NSLayoutConstraint?
    var cuisineLabelLeftAnchorConstraint: NSLayoutConstraint?
    var cuisineLabelRightAnchorConstraint: NSLayoutConstraint?
    var cuisineLabelHeightAnchorConstraint: NSLayoutConstraint?
    var cuisineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        label.text = "Mexican - $$"
        return label
    }()
    
    var costLabelTopAnchorConstraint: NSLayoutConstraint?
    var costLabelLeftAnchorConstraint: NSLayoutConstraint?
    var costLabelRightAnchorConstraint: NSLayoutConstraint?
    var costLabelHeightAnchorConstraint: NSLayoutConstraint?
    var costLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        label.text = "25-35 MIN $6.89 4.4(177)"
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cuisineLabel, costLabel ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalSpacing
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: -5, height: 5)
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.5
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(nameLabel)
        nameLabelTopAnchorConstraint = nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10)
        nameLabelLeftAnchorConstraint = nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15)
        nameLabelRightAnchorConstraint = nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15)
        nameLabelHeightAnchorConstraint = nameLabel.heightAnchor.constraint(equalToConstant: 40)
        NSLayoutConstraint.activate([
            nameLabelTopAnchorConstraint!,
            nameLabelLeftAnchorConstraint!,
            nameLabelRightAnchorConstraint!,
            nameLabelHeightAnchorConstraint!
            ])
        
        addSubview(cuisineLabel)
        cuisineLabelTopAnchorConstraint = cuisineLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5)
        cuisineLabelLeftAnchorConstraint = cuisineLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15)
        cuisineLabelRightAnchorConstraint = cuisineLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15)
        cuisineLabelHeightAnchorConstraint = cuisineLabel.heightAnchor.constraint(equalToConstant: 15)
        NSLayoutConstraint.activate([
            cuisineLabelTopAnchorConstraint!,
            cuisineLabelLeftAnchorConstraint!,
            cuisineLabelRightAnchorConstraint!,
            cuisineLabelHeightAnchorConstraint!
            ])
        
        addSubview(costLabel)
        costLabelTopAnchorConstraint = costLabel.topAnchor.constraint(equalTo: cuisineLabel.bottomAnchor, constant: 5)
        costLabelLeftAnchorConstraint = costLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15)
        costLabelRightAnchorConstraint = costLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
        costLabelHeightAnchorConstraint = costLabel.heightAnchor.constraint(equalToConstant: 15)
        NSLayoutConstraint.activate([
            costLabelTopAnchorConstraint!,
            costLabelLeftAnchorConstraint!,
            costLabelRightAnchorConstraint!,
            costLabelHeightAnchorConstraint!
            ])
    }
}
