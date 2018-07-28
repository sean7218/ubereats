//
//  DetailViewController.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/26/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var height: CGFloat?
    var delegate: CoverImageDelegate?
    var yContraint: NSLayoutConstraint?
    var lContraint: NSLayoutConstraint?
    var rContraint: NSLayoutConstraint?
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.setImage(#imageLiteral(resourceName: "button-normal").withRenderingMode(.alwaysOriginal), for: UIControlState.normal)
        button.setImage(#imageLiteral(resourceName: "button-pressed").withRenderingMode(.alwaysOriginal), for: UIControlState.highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissViewController), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: "DetailCell")
        cv.register(DetailHeaderCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "DetailHeader")
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
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: -44),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height)
            ])
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            backButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44)
            ])
        view.addSubview(headerView)
        yContraint = headerView.centerYAnchor.constraint(equalTo: collectionView.topAnchor, constant: 0)
        lContraint = headerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30)
        rContraint = headerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
        NSLayoutConstraint.activate([
            yContraint!,
            lContraint!,
            rContraint!,
            headerView.heightAnchor.constraint(equalToConstant: 100)
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
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderImage(scrollView)
        updateHeaderView(scrollView)
    }
    fileprivate func updateHeaderImage(_ scrollView: UIScrollView) {
        let pos = scrollView.contentOffset.y
        if (pos < -44){
            delegate?.updateImageHeight(height: (256-pos))
            delegate?.updateImageTopAnchorConstraint(constant: (pos+44))
        }
    }
    fileprivate func updateHeaderView(_ scrollView: UIScrollView){
        let pos = scrollView.contentOffset.y
        let pec = 1 - (pos+44)/194
        if pos == -44 {
            yContraint?.constant = 300
        }
        if (pos > -44){
            yContraint?.constant = 256 - pos
            lContraint?.constant = 30 * pec
            rContraint?.constant = -(30 * pec)
        }
        if pos < -44 {
            yContraint?.constant = 256 - pos
        }
        if pos > 163 {
            yContraint?.constant = 94
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "DetailHeader", for: indexPath) as! DetailHeaderCollectionViewCell
        self.delegate = cell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}
protocol CoverImageDelegate {

    func updateImageHeight(height:CGFloat)
    func updateImageTopAnchorConstraint(constant: CGFloat)
}

class DetailHeaderCollectionViewCell: UICollectionViewCell, CoverImageDelegate {

    var coverImageHeightConstraint: NSLayoutConstraint?
    var coverImageTopAnchorConstraint: NSLayoutConstraint?
    let coverImageView: UIImageView = {
        let iv = UIImageView(image:#imageLiteral(resourceName: "ramen_cat") )
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
        coverImageHeightConstraint = coverImageView.heightAnchor.constraint(equalToConstant: 300)
        coverImageTopAnchorConstraint = coverImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0)
        NSLayoutConstraint.activate([
            coverImageTopAnchorConstraint!,
            coverImageView.leftAnchor.constraint(equalTo: leftAnchor),
            coverImageView.rightAnchor.constraint(equalTo: rightAnchor),
            coverImageHeightConstraint!
            ])
    }
    func updateImageHeight(height: CGFloat) {
        coverImageHeightConstraint?.constant = height
    }
    func updateImageTopAnchorConstraint(constant: CGFloat) {
        coverImageTopAnchorConstraint?.constant = constant
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
