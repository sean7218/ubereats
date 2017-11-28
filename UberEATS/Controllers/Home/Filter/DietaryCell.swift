//
//  PriceCollectionViewCell.swift
//  UberEATS
//
//  Created by Sean Zhang on 11/27/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class DietaryCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .red
        cv.showsVerticalScrollIndicator = false
        //cv.isScrollEnabled = false
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PriceCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        setupViews()
    }
    
    fileprivate func setupViews(){
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PriceCell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

