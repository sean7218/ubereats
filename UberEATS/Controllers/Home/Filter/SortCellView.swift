//
//  SortView.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/23/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit



class SortCellViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sortImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "home-page-50"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(sortImageView)
        NSLayoutConstraint.activate([
            sortImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            sortImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            sortImageView.widthAnchor.constraint(equalToConstant: 30),
            sortImageView.heightAnchor.constraint(equalToConstant: 30)
            ])
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            nameLabel.leftAnchor.constraint(equalTo: sortImageView.rightAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalToConstant: self.frame.width - 70),
            nameLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
    }

    
    // todo: when selected - change the color:
}
