//
//  PriceRange.swift
//  UberEATS
//
//  Created by Sean Zhang on 11/30/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class FilterViewCell2: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var priceRangeLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Price Range"
        label.backgroundColor = UIColor.orange
        return label
    }()
    
    var bookingFeeLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Max Booking Fee"
        label.backgroundColor = UIColor.orange
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.allowsMultipleSelection = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(PriceCell.self, forCellWithReuseIdentifier: "PriceCell")
        cv.allowsSelection = true
        return cv
    }()
    
    lazy var slideButtonView: UISlider = {
        let slider = UISlider(frame: CGRect.zero)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.backgroundColor = UIColor.brown
        slider.isContinuous = true
        slider.maximumValue = 6
        slider.minimumValue = 4
        slider.addTarget(self, action: #selector(sliderValueChange(_:)), for: UIControlEvents.valueChanged)
        return slider
    }()
    
    @objc func sliderValueChange(_ sender: UISlider){
        print("value changed")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
        addSubview(priceRangeLabel)
        NSLayoutConstraint.activate([
            priceRangeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            priceRangeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            priceRangeLabel.widthAnchor.constraint(equalToConstant: frame.width - 20),
            priceRangeLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            collectionView.topAnchor.constraint(equalTo: priceRangeLabel.bottomAnchor, constant: 10),
            collectionView.widthAnchor.constraint(equalToConstant: frame.width - 20),
            collectionView.heightAnchor.constraint(equalToConstant: 50)
            ])
        addSubview(bookingFeeLabel)
        NSLayoutConstraint.activate([
            bookingFeeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            bookingFeeLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            bookingFeeLabel.widthAnchor.constraint(equalToConstant: frame.width - 20),
            bookingFeeLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        addSubview(slideButtonView)
        NSLayoutConstraint.activate([
            slideButtonView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            slideButtonView.topAnchor.constraint(equalTo: bookingFeeLabel.bottomAnchor, constant: 10),
            slideButtonView.widthAnchor.constraint(equalToConstant: frame.width - 20),
            slideButtonView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let priceCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PriceCell", for: indexPath) as! PriceCell
        return priceCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = indexPath.row
        print(item)
    }
}



