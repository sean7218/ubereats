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
    var delegate2: HeaderViewDelegate?
    var yContraint: NSLayoutConstraint?
    var lContraint: NSLayoutConstraint?
    var rContraint: NSLayoutConstraint?
    var meals: [Meal] = Meal.loadDemoMeals()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.setImage(#imageLiteral(resourceName: "back-white").withRenderingMode(.alwaysOriginal), for: UIControlState.normal)
        button.setImage(#imageLiteral(resourceName: "back-black").withRenderingMode(.alwaysOriginal), for: UIControlState.highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissViewController), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    lazy var headerView: HeaderView = {
        let view = HeaderView()
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
        cv.register(InfoCollectionViewCell.self, forCellWithReuseIdentifier: "InfoCell")
        cv.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "MenuCell")
        cv.register(DetailHeaderCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "DetailHeader")
        cv.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "EmptyCell")
        return cv
    }()
    
    @objc func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
        //
        return IndexPath(row: 0, section: 0)
    }
    func indexTitles(for collectionView: UICollectionView) -> [String]? {
        //
        return ["so"]
    }
    func setupViews(){
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: -44),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height)
            ])

        self.delegate2 = headerView
        view.addSubview(headerView)
        yContraint = headerView.centerYAnchor.constraint(equalTo: collectionView.topAnchor, constant: 0)
        lContraint = headerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30)
        rContraint = headerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
        NSLayoutConstraint.activate([
            yContraint!,
            lContraint!,
            rContraint!,
            headerView.heightAnchor.constraint(equalToConstant: 130)
            ])
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -1),
            backButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as! DetailCollectionViewCell
        let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCell", for: indexPath) as! InfoCollectionViewCell
        let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCollectionViewCell
        cell.backgroundColor = .white
        if (indexPath.section == 0) && (indexPath.row == 0) {
            return infoCell
        } else if (indexPath.section == 0) && (indexPath.row == 1) {
            return menuCell
        } else {
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (indexPath.section == 0) && (indexPath.row < 2) {
            return indexPath.row == 0 ?  CGSize(width: view.frame.width, height: 100) : CGSize(width: view.frame.width, height: 50)
        }
        return CGSize(width: view.frame.width, height: 90)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderImage(scrollView)
        updateHeaderView(scrollView)
        updateHeaderViewLabel(scrollView)
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
        //print(pos)
        let pec = 1 - (pos+44)/194
        if pos == -44 {
            yContraint?.constant = 300
        }
        if (pos > -44) && (pos < 166){
            yContraint?.constant = 256 - pos
            lContraint?.constant = 30 * pec
            rContraint?.constant = -(30 * pec)
        }
        if pos < -44 {
            yContraint?.constant = 256 - pos
        }
        if pos > 147 {
            yContraint?.constant = (130/2 + 44)
            backButton.setImage(#imageLiteral(resourceName: "back-black").withRenderingMode(.alwaysOriginal), for: .normal)
        } else {
            backButton.setImage(#imageLiteral(resourceName: "back-white").withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }
    fileprivate func updateHeaderViewLabel(_ scrollView: UIScrollView) {
        let pos = scrollView.contentOffset.y
        if (pos > -44) && (pos < 164) {
            //print(pos)
            delegate2?.updateHeaderViewLabelOpacity(constant: pos)
            delegate2?.updateHeaderViewLabelSize(constant: pos)
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        print(indexPath.section)
        let emptyCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "EmptyCell", for: indexPath)
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "DetailHeader", for: indexPath) as! DetailHeaderCollectionViewCell
        self.delegate = header
        if (kind == UICollectionElementKindSectionHeader) && (indexPath.section == 0) {
            return header
        } else {
            emptyCell.frame.size.height = 0
            emptyCell.frame.size.width = 0
            emptyCell.backgroundColor = .red
            return emptyCell
        }
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return section == 0 ? CGSize(width: view.frame.width, height: 300) : CGSize(width: view.frame.width, height: 0)
    }
}
protocol CoverImageDelegate {
    func updateImageHeight(height:CGFloat)
    func updateImageTopAnchorConstraint(constant: CGFloat)
}

protocol HeaderViewDelegate {
    func updateHeaderViewLabelOpacity(constant: CGFloat)
    func updateHeaderViewLabelSize(constant: CGFloat)
}



