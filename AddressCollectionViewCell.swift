//
//  AddressCollectionViewCell.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/24/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class AddressCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                print(addressTitleLabel.text ?? "Nothing")
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
    
    var addressImage: UIImage? {
        didSet {
            addressImageView.image = addressImage
        }
    }
    var addressTitle: String? {
        didSet {
            let attrText = NSAttributedString(string: addressTitle!, attributes: [
                NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)
                ])
            addressTitleLabel.attributedText = attrText
        }
    }
    var address: String? {
        didSet {
            let attrText = NSAttributedString(string: address!, attributes: [
                NSAttributedStringKey.font : UIFont.italicSystemFont(ofSize: 13),
                NSAttributedStringKey.foregroundColor : UIColor.darkGray
                ])
            addressLabel.attributedText = attrText
        }
    }
    var delivery: String? {
        didSet {
            let attrText = NSAttributedString(string: delivery!, attributes: [
                NSAttributedStringKey.font : UIFont.italicSystemFont(ofSize: 13),
                NSAttributedStringKey.foregroundColor : UIColor.darkGray
                ])
            deliveryLabel.attributedText = attrText
        }
    }
    lazy var addressImageView: UIImageView = {
        let image: UIImage = #imageLiteral(resourceName: "current-1").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var addressTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let text = "Current Location"
        let attrText = NSAttributedString(string: text, attributes: [
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)
            ])
        label.attributedText = attrText
        return label
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let text = "2590 North Moreland Blvd, Shaker Heights, Ohio 44120"
        let attrText = NSAttributedString(string: text, attributes: [
            NSAttributedStringKey.font : UIFont.italicSystemFont(ofSize: 12)
            ])
        label.attributedText = attrText
        return label
    }()
    
    lazy var deliveryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let text = "Deliver to door"
        let attrText = NSAttributedString(string: text, attributes: [
            NSAttributedStringKey.font : UIFont.italicSystemFont(ofSize: 12)
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
        addSubview(addressImageView)
        NSLayoutConstraint.activate([
            addressImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            addressImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            addressImageView.widthAnchor.constraint(equalToConstant: 20),
            addressImageView.heightAnchor.constraint(equalToConstant: 20)
            ])
        addSubview(addressTitleLabel)
        NSLayoutConstraint.activate([
            addressTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            addressTitleLabel.leftAnchor.constraint(equalTo: addressImageView.rightAnchor, constant: 15),
            addressTitleLabel.widthAnchor.constraint(equalToConstant: frame.width - 80),
            addressTitleLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        addSubview(addressLabel)
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: addressTitleLabel.bottomAnchor, constant: 0),
            addressLabel.leftAnchor.constraint(equalTo: addressImageView.rightAnchor, constant: 15),
            addressLabel.widthAnchor.constraint(equalToConstant: frame.width - 80),
            addressLabel.heightAnchor.constraint(equalToConstant: 15)
            ])
        addSubview(deliveryLabel)
        NSLayoutConstraint.activate([
            deliveryLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 0),
            deliveryLabel.leftAnchor.constraint(equalTo: addressImageView.rightAnchor, constant: 15),
            deliveryLabel.widthAnchor.constraint(equalToConstant: frame.width - 80),
            deliveryLabel.heightAnchor.constraint(equalToConstant: 15)
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
