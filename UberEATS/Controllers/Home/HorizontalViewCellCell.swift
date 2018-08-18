//
//  HorizontalViewCellCell.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/14/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit


class HorizontalViewCellCell: UICollectionViewCell {
       
    var imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "tennesse_taco_co"))
        iv.contentMode = .redraw
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .yellow
        return iv
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tennesse Taco Company"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = .white
        return label
    }()
    
    var cuisineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mexican - $$"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        label.backgroundColor = .white
        return label
    }()
    
    var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4.4 (177)"
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .white
        return label
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25-35 MIN"
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .white
        label.textAlignment = .right
        return label
    }()
    
    var feeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$6.89"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .right
        label.backgroundColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
        let cellWidth = frame.width - 30
        print(cellWidth)
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100)
            ])
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            nameLabel.widthAnchor.constraint(equalToConstant: (cellWidth*0.66)),
            nameLabel.heightAnchor.constraint(equalToConstant: 15)
            ])
        addSubview(cuisineLabel)
        NSLayoutConstraint.activate([
            cuisineLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            cuisineLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            cuisineLabel.widthAnchor.constraint(equalToConstant: cellWidth*0.66),
            cuisineLabel.heightAnchor.constraint(equalToConstant: 15)
            ])
        addSubview(ratingLabel)
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: cuisineLabel.bottomAnchor, constant: 5),
            ratingLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            ratingLabel.widthAnchor.constraint(equalToConstant: 150),
            ratingLabel.heightAnchor.constraint(equalToConstant: 15)
            ])
        addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            timeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            timeLabel.widthAnchor.constraint(equalToConstant: cellWidth*0.31),
            timeLabel.heightAnchor.constraint(equalToConstant: 15)
            ])
        addSubview(feeLabel)
        NSLayoutConstraint.activate([
            feeLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 5),
            feeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            feeLabel.widthAnchor.constraint(equalToConstant: cellWidth*0.31),
            feeLabel.heightAnchor.constraint(equalToConstant: 15)
            ])
    }
}

