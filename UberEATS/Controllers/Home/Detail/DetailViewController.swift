//
//  DetailViewController.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/26/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.setImage(#imageLiteral(resourceName: "button-normal").withRenderingMode(.alwaysOriginal), for: UIControlState.normal)
        button.setImage(#imageLiteral(resourceName: "button-pressed").withRenderingMode(.alwaysOriginal), for: UIControlState.highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissViewController), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    let coverImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "tennesse_taco_co"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: "DetailCell")
        return cv
    }()
    
    @objc func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    func setupViews(){
        view.addSubview(coverImageView)
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: view.topAnchor),
            coverImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            coverImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            coverImageView.heightAnchor.constraint(equalToConstant: 300)
            ])
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: coverImageView.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height - 300)
            ])
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            backButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44)
            ])
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as! DetailCollectionViewCell
        cell.backgroundColor = .white
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 90)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let y = targetContentOffset.pointee.y
        print(y)
    }
}
class DetailHeaderCollectionViewCell: UICollectionViewCell {
    
    let coverImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "tennesse_taco_co"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(coverImageView)
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: topAnchor),
            coverImageView.leftAnchor.constraint(equalTo: leftAnchor),
            coverImageView.rightAnchor.constraint(equalTo: rightAnchor),
            coverImageView.heightAnchor.constraint(equalToConstant: 300)
            ])
    }
}
class DetailCollectionViewCell: UICollectionViewCell {
    
    var nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "Debos Remedy"
        return label
    }()
    var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.italicSystemFont(ofSize: 11)
        label.text = "Carrot, beet, cucumber, romaine, lemon, genger, and cayenne pepper. Certified Organic. 16 oz bottle"
        return label
    }()
    var dollarLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.italicSystemFont(ofSize: 11)
        label.text = "$11.00"
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
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 3),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -3),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        addSubview(infoLabel)
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            infoLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 3),
            infoLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -3),
            infoLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        addSubview(dollarLabel)
        NSLayoutConstraint.activate([
            dollarLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 5),
            dollarLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 3),
            dollarLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -3),
            dollarLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
    }
}
