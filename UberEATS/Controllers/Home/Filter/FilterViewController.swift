//
//  FilterViewController.swift
//  UberEATS
//
//  Created by Sean Zhang on 11/25/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("X", for: .normal)
        button.addTarget(self, action: #selector(closeFilterView), for: .touchUpInside)
        return button
    }()
    
    var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RESET", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        return button
    }()
    
    lazy var filterViewMenu: FilterViewMenu = {
        let sv = FilterViewMenu()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    var menuSlideAnchor: NSLayoutConstraint?
    lazy var menuWidth: CGFloat = {
        let width = self.view.frame.width/3
        return width
    }()
    let menuSlider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("DONE", for: .normal)
        button.tintColor = UIColor.black
        button.backgroundColor = UIColor.lightGray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeFilterView), for: .touchUpInside)

        return button
    }()

    var delegate: FilterViewDelegate?
    
    @objc func closeFilterView(){
        delegate?.closeFilterView()
    }
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(FilterViewCell1.self, forCellWithReuseIdentifier: "Sort")
        collectionView.register(FilterViewCell2.self, forCellWithReuseIdentifier: "Price")
        collectionView.register(FilterViewCell3.self, forCellWithReuseIdentifier: "Dietary")
        filterViewMenu.delegate = self
        setupViews()
    }

    
    fileprivate func setupViews(){
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 353)
        view.backgroundColor = .white


        view.addSubview(cancelButton)
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            cancelButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 50),
            cancelButton.heightAnchor.constraint(equalToConstant: 30)
            ])
        view.addSubview(resetButton)
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            resetButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            resetButton.widthAnchor.constraint(equalToConstant: 50),
            resetButton.heightAnchor.constraint(equalToConstant: 30)
            ])
        view.addSubview(filterViewMenu)
        NSLayoutConstraint.activate([
            filterViewMenu.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 5),
            filterViewMenu.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            filterViewMenu.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            filterViewMenu.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        view.addSubview(menuSlider)
        menuSlideAnchor = menuSlider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        NSLayoutConstraint.activate([
            menuSlider.topAnchor.constraint(equalTo: filterViewMenu.bottomAnchor, constant: 1),
            menuSlideAnchor!,
            menuSlider.widthAnchor.constraint(equalToConstant: menuWidth),
            menuSlider.heightAnchor.constraint(equalToConstant: 3)
            ])
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: menuSlider.bottomAnchor, constant: 10),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 200)
            ])
        view.addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0),
            doneButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            doneButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            doneButton.heightAnchor.constraint(equalToConstant: 43.5)
            ])
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "Sort", for: indexPath) as! FilterViewCell1
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "Price", for: indexPath) as! FilterViewCell2
        let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "Dietary", for: indexPath) as! FilterViewCell3
        if indexPath.row == 0 {
            return cell1
        } else if indexPath.row == 1 {
            return cell2
        } else {
            return cell3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let itemAtIndex = Int(x/(view.frame.width))
        filterViewMenu.collectionView.selectItem(at: IndexPath.init(item: itemAtIndex, section: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.centeredHorizontally)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        menuSlideAnchor?.constant = x/3
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // print("begin dragging")
        // collectionView.reloadData()
    }
}

extension FilterViewController: FilterViewMenuDelegate {
    func selectTheMenu(index: Int) {
        self.collectionView.selectItem(at: IndexPath(item: index, section: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.centeredHorizontally)
    }
}

