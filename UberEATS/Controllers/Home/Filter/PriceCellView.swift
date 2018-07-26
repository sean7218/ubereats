//
//  PriceCellView.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/23/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class PriceCell: UICollectionViewCell {
    
    lazy var dollarImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "button-normal"), highlightedImage: #imageLiteral(resourceName: "button-highlighted"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override var isSelected: Bool {
        didSet {
            print("IsSelected on the PriceCell")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(dollarImageView)
        NSLayoutConstraint.activate([
            dollarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            dollarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dollarImageView.widthAnchor.constraint(equalTo: widthAnchor),
            dollarImageView.heightAnchor.constraint(equalTo: heightAnchor)
            ])
    }
}
