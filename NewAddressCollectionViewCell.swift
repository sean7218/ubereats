//
//  NewAddressCollectionViewCell.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/24/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class NewAddressCollectionViewCell: UICollectionViewCell {

    
    lazy var addressImageView: UIImageView = {
        let image: UIImage = #imageLiteral(resourceName: "address-1").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var addressTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints  = false
        textField.placeholder = "Address"
        textField.addTarget(self, action: #selector(searchAddress(_:)), for: UIControlEvents.editingChanged)
        return textField
    }()

    @objc func searchAddress(_ sender: UITextField) {
        print("address input changed")
    }
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
        addSubview(addressTextField)
        NSLayoutConstraint.activate([
            addressTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            addressTextField.leftAnchor.constraint(equalTo: addressImageView.rightAnchor, constant: 15),
            addressTextField.widthAnchor.constraint(equalToConstant: frame.width - 30),
            addressTextField.heightAnchor.constraint(equalToConstant: 20)
            ])
    }
}
