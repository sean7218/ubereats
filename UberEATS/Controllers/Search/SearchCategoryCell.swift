//
//  SearchCategoryCell.swift
//  UberEATS
//
//  Created by Sean Zhang on 9/12/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class SearchCategoryCell: UICollectionViewCell {
    
    var backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "tennesse_taco_co")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var categoryLabel: UILabel = {
        let cl = UILabel()
        cl.translatesAutoresizingMaskIntoConstraints = false
        cl.text = "Chinese"
        return cl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            backgroundImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 0),
            backgroundImageView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
        addSubview(categoryLabel)
        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            categoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            categoryLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: 0),
            categoryLabel.heightAnchor.constraint(equalTo: heightAnchor, constant: 0)
            ])
    }
}
