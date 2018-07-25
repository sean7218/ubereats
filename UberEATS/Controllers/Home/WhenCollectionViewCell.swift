//
//  WhenCollectionViewCell.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/24/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class WhenCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            if (self.isSelected) {
                print(whenLabel.text ?? "Nothing")
                self.tickImageView.isHidden = false
            } else {
                self.tickImageView.isHidden = true
            }
        }
    }
    
    var tickImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "tick-1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        return imageView
    }()
    
    var whenIMG: UIImage? {
        didSet {
            whenImageView.image = whenIMG
        }
    }
    var whenTXT: String? {
        didSet {
            let attrText = NSAttributedString(string: whenTXT!, attributes: [
                NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)
                ])
            whenLabel.attributedText = attrText
        }
    }
    
    lazy var whenImageView: UIImageView = {
        let image: UIImage = #imageLiteral(resourceName: "current-1").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var whenLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let text = "Current Location"
        let attrText = NSAttributedString(string: text, attributes: [
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)
            ])
        label.attributedText = attrText
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
        backgroundColor = .white
        addSubview(whenImageView)
        NSLayoutConstraint.activate([
            whenImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            whenImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            whenImageView.widthAnchor.constraint(equalToConstant: 20),
            whenImageView.heightAnchor.constraint(equalToConstant: 20)
            ])
        addSubview(whenLabel)
        NSLayoutConstraint.activate([
            whenLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            whenLabel.leftAnchor.constraint(equalTo: whenImageView.rightAnchor, constant: 15),
            whenLabel.widthAnchor.constraint(equalToConstant: frame.width - 80),
            whenLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        addSubview(tickImageView)
        NSLayoutConstraint.activate([
            tickImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            tickImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
            tickImageView.widthAnchor.constraint(equalToConstant: 15),
            tickImageView.heightAnchor.constraint(equalToConstant: 15)
            ])
    }
}
