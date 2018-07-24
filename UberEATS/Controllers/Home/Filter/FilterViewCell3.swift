//
//  FilterViewCell3.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/23/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class FilterViewCell3: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.allowsMultipleSelection = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(DietaryCell.self, forCellWithReuseIdentifier: "DietaryCell")
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
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
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dietaryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DietaryCell", for: indexPath) as! DietaryCell
        return dietaryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width - 20, height: frame.height)
    }
}

class DietaryCell: UICollectionViewCell {
    
    let dietaryCellView: DietaryCellView = {
        let view = DietaryCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(dietaryCellView)
        NSLayoutConstraint.activate([
            dietaryCellView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            dietaryCellView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            dietaryCellView.widthAnchor.constraint(equalTo: widthAnchor),
            dietaryCellView.heightAnchor.constraint(equalTo: heightAnchor)
            ])
    }
}
