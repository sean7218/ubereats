//
//  homeViewController.swift
//  UberEATS
//
//  Created by Sean Zhang on 11/25/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, FilterViewDelegate {
    
    lazy var grayBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 1, alpha: 0.7)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeFilterView)))
        return view
    }()
    
    lazy var filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sort Restaurants", for: .normal)
        let attributedText = NSMutableAttributedString(string: "Sort Restaurants", attributes: [NSAttributedStringKey.font: UIFont.italicSystemFont(ofSize: 12)])
        button.titleLabel?.attributedText = attributedText
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.tintColor = .black
        button.addTarget(self, action: #selector(showFilterView), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowRadius = 2
        button.layer.shouldRasterize = false
        return button
    }()
    
    lazy var filterViewController: FilterViewController = {
        let vc = FilterViewController()
        vc.delegate = self
        return vc
    }()
    
    @objc func showFilterView() {
        self.view.addSubview(self.grayBackgroundView)

        NSLayoutConstraint.activate([
            self.grayBackgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.grayBackgroundView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.grayBackgroundView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            self.grayBackgroundView.heightAnchor.constraint(equalToConstant: self.view.frame.height)
            ])
        
        self.view.addSubview(filterViewController.view)
        self.addChildViewController(filterViewController)
        filterViewController.didMove(toParentViewController: self)
        self.filterViewController.view.frame.origin.y = -400
        UIView.animate(withDuration: 0.8, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.filterViewController.view.frame.origin.y = 0
        }) { (isCompleted: Bool) in
            print("FilterViewShowed Completed")

        }
    }
    
    
    @objc func closeFilterView() {
        print("closing filterview")
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions.curveLinear, animations: {
            self.filterViewController.view.frame.origin.y = -500
            self.grayBackgroundView.removeFromSuperview()
        }) { (isCompleted: Bool) in
            if (isCompleted) {
                
                self.filterViewController.view.removeFromSuperview()
            }
        }
    }
    
    @objc func showLocationView() {
        print("showLocationView")
        let locationViewController: LocationViewController = LocationViewController()
        navigationController?.present(locationViewController, animated: true, completion: { () -> Void in
            print("Hl")
        })
    }
    
    @objc func closeLocationView(){
        
    }
    
    func setupViews(){
        // navigation title
        let attributedText = NSMutableAttributedString(string: "2590 N Moreland Blvd", attributes: [NSAttributedStringKey.font: UIFont.italicSystemFont(ofSize: 12)])
        let titleLabel = UILabel()
        titleLabel.attributedText = attributedText
        navigationItem.titleView = titleLabel
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(showLocationView))
        navigationItem.titleView?.isUserInteractionEnabled = true
        navigationItem.titleView?.addGestureRecognizer(recognizer)
        navigationController?.navigationBar.isTranslucent = false
        
       // filter bar below navigationBar
        view.addSubview(filterButton)
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            filterButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            filterButton.widthAnchor.constraint(equalToConstant: view.frame.width),
            filterButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.register(HomeViewCell.self, forCellWithReuseIdentifier: "HomeViewCell")
        self.collectionView?.register(HorizontalViewCell.self, forCellWithReuseIdentifier: "HoriCell")
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 35).isActive = true
        collectionView?.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView?.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.collectionView?.backgroundColor = .gray
        
        
        setupViews()
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 3
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (indexPath.section == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HoriCell", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeViewCell", for: indexPath)
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}
