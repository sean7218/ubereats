//
//  PriceRange.swift
//  UberEATS
//
//  Created by Sean Zhang on 11/30/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class FilterViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.allowsMultipleSelection = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(SortCell.self, forCellWithReuseIdentifier: "SortCell")
        cv.register(PriceCell.self, forCellWithReuseIdentifier: "PriceCell")
        return cv
    }()
    
    var oneDollarButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setTitle("$", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var twoDollarButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setTitle("$$", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var threeDollarButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setTitle("$$$", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var fourDollarButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setTitle("$$$$", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
//        addSubview(oneDollarButton)
//        NSLayoutConstraint.activate([
//            oneDollarButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
//            oneDollarButton.centerYAnchor.constraint(equalTo: centerYAnchor),
//            oneDollarButton.widthAnchor.constraint(equalToConstant: 50),
//            oneDollarButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
//        addSubview(twoDollarButton)
//        NSLayoutConstraint.activate([
//            twoDollarButton.leftAnchor.constraint(equalTo: oneDollarButton.rightAnchor, constant: 5),
//            twoDollarButton.centerYAnchor.constraint(equalTo: centerYAnchor),
//            twoDollarButton.widthAnchor.constraint(equalToConstant: 50),
//            twoDollarButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
//        addSubview(threeDollarButton)
//        NSLayoutConstraint.activate([
//            threeDollarButton.leftAnchor.constraint(equalTo: twoDollarButton.rightAnchor, constant: 5),
//            threeDollarButton.centerYAnchor.constraint(equalTo: centerYAnchor),
//            threeDollarButton.widthAnchor.constraint(equalToConstant: 50),
//            threeDollarButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
//        addSubview(fourDollarButton)
//        NSLayoutConstraint.activate([
//            fourDollarButton.leftAnchor.constraint(equalTo: threeDollarButton.rightAnchor, constant: 5),
//            fourDollarButton.centerYAnchor.constraint(equalTo: centerYAnchor),
//            fourDollarButton.widthAnchor.constraint(equalToConstant: 50),
//            fourDollarButton.heightAnchor.constraint(equalToConstant: 50)
//        ])

        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            collectionView.centerYAnchor.constraint(equalTo: centerYAnchor),
            collectionView.widthAnchor.constraint(equalToConstant: frame.width),
            collectionView.heightAnchor.constraint(equalToConstant: frame.height)
        ])
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.row == 1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PriceCell", for: indexPath) as! PriceCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SortCell", for: indexPath) as! SortCell
        cell.nameLabel.text = "something"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width - 20, height: frame.height/3)
    }
}

class SortCell: UICollectionViewCell {
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.cyan
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

class PriceCell: UICollectionViewCell {
    
    var oneDollarButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setTitle("$", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        addSubview(oneDollarButton)
        NSLayoutConstraint.activate([
            oneDollarButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            oneDollarButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            oneDollarButton.widthAnchor.constraint(equalToConstant: 50),
            oneDollarButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
