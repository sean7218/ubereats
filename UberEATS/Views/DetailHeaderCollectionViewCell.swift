//
//  DetailHeaderCollectionViewCell.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/28/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class DetailHeaderCollectionViewCell: UICollectionViewCell, CoverImageDelegate {
    
    var coverImageHeightConstraint: NSLayoutConstraint?
    var coverImageTopAnchorConstraint: NSLayoutConstraint?
    let coverImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "tennesse_taco_co") )
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(coverImageView)
        coverImageHeightConstraint = coverImageView.heightAnchor.constraint(equalToConstant: 300)
        coverImageTopAnchorConstraint = coverImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0)
        NSLayoutConstraint.activate([
            coverImageTopAnchorConstraint!,
            coverImageView.leftAnchor.constraint(equalTo: leftAnchor),
            coverImageView.rightAnchor.constraint(equalTo: rightAnchor),
            coverImageHeightConstraint!
            ])
    }
    func updateImageHeight(height: CGFloat) {
        coverImageHeightConstraint?.constant = height
    }
    func updateImageTopAnchorConstraint(constant: CGFloat) {
        coverImageTopAnchorConstraint?.constant = constant
    }
}
