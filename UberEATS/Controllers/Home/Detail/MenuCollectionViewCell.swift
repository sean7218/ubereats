//
//  MenuCollectionViewCell.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/28/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    

    let menuButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Menu", for: UIControlState.normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let searchButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: UIControlState.normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    var topSeperator: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .lightGray
        return line
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
        addSubview(menuButton)
        NSLayoutConstraint.activate([
            menuButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            menuButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            menuButton.widthAnchor.constraint(equalToConstant: 100),
            menuButton.heightAnchor.constraint(equalToConstant: 20)
            ])
        addSubview(searchButton)
        NSLayoutConstraint.activate([
            searchButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            searchButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            searchButton.widthAnchor.constraint(equalToConstant: 100),
            searchButton.heightAnchor.constraint(equalToConstant: 20)
            ])
        addSubview(topSeperator)
        NSLayoutConstraint.activate([
            topSeperator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            topSeperator.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            topSeperator.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            topSeperator.heightAnchor.constraint(equalToConstant: 0.2)
            ])
    }
}
