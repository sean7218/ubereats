//
//  DetailViewController.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/26/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    
   lazy var sectionTitleIndexCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = SectionTitleIndexCollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(SectionTitleIndexCollectionViewCell.self, forCellWithReuseIdentifier: "TitleCell")
        return cv
    }()
    
    var height: CGFloat?
    var delegate: CoverImageDelegate?
    var delegate2: HeaderViewDelegate?
    var yContraint: NSLayoutConstraint?
    var lContraint: NSLayoutConstraint?
    var rContraint: NSLayoutConstraint?
    var meals: [Meal] = Meal.loadDemoMeals()
    var mealSections: [String] = Meal.loadMealSections()
    
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
        cv.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader")
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
        view.addSubview(sectionTitleIndexCollectionView)
        NSLayoutConstraint.activate([
            sectionTitleIndexCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: -44),
            sectionTitleIndexCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            sectionTitleIndexCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            sectionTitleIndexCollectionView.heightAnchor.constraint(equalToConstant: 80)
            ])
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        if collectionView == self.sectionTitleIndexCollectionView {
            return 1
        }
        print("number of mealSections: \(mealSections.count)")
        return mealSections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.sectionTitleIndexCollectionView {
            return mealSections.count
        }
        print("current section \(section)")
        let rows = Meal.loadMealsForSection(sectionName: mealSections[section], meals: meals)
        let num = rows.count
        print("current rows: \(num)")
        return num
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == self.sectionTitleIndexCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath) as! SectionTitleIndexCollectionViewCell
            return cell
        }
        if (indexPath.section == 0) && (indexPath.row == 0) {
            let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCell", for: indexPath) as! InfoCollectionViewCell
            return infoCell
        } else if (indexPath.section == 0) && (indexPath.row == 1) {
            let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCollectionViewCell
            return menuCell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as! DetailCollectionViewCell
            let rows = Meal.loadMealsForSection(sectionName: mealSections[indexPath.section], meals: meals)
            cell.meal = rows[indexPath.row]
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
        if (kind == UICollectionElementKindSectionHeader) && (indexPath.section == 0) && (indexPath.row == 0) {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "DetailHeader", for: indexPath) as! DetailHeaderCollectionViewCell
            self.delegate = header
            return header
        } else if (kind == UICollectionElementKindSectionHeader) && (indexPath.section != 0){
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderView
            sectionHeader.title = mealSections[indexPath.section]
            return sectionHeader
        } else {
            let emptyCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "EmptyCell", for: indexPath)
            emptyCell.frame.size.height = 0
            emptyCell.frame.size.width = 0
            emptyCell.backgroundColor = .red
            return emptyCell
        }
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return section == 0 ? CGSize(width: view.frame.width, height: 300) : CGSize(width: view.frame.width, height: 50)
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



