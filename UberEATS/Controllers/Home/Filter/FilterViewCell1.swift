//
//  PriceRange.swift
//  UberEATS
//
//  Created by Sean Zhang on 11/30/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class FilterViewCell1: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.allowsMultipleSelection = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(SortCell.self, forCellWithReuseIdentifier: "SortCell")
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
        let sortCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SortCell", for: indexPath) as! SortCell
        return sortCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
}

class SortCell: UICollectionViewCell,  UITableViewDelegate,  UITableViewDataSource {
    
    lazy var tableView: UITableView = {
       let tableView = UITableView(frame: CGRect.zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let sortOptions: [String] = ["Recommended", "Most popular", "Rating"];
    let sortImages:[String] = ["rec.png", "pop.png", "rate.png"];
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SortCellViewCell", for: indexPath) as! SortCellViewCell
        cell.nameLabel.text = sortOptions[indexPath.row];
        cell.sortImageView.image = UIImage(named: sortImages[indexPath.row])
        return cell
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.register(SortCellViewCell.self, forCellReuseIdentifier: "SortCellViewCell")
        tableView.isScrollEnabled = false
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150 / 3
        tableView.allowsMultipleSelection = false
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            tableView.widthAnchor.constraint(equalTo: widthAnchor),
            tableView.heightAnchor.constraint(equalTo: heightAnchor)
            ])
    }
}

