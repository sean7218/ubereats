//
//  homeViewController.swift
//  UberEATS
//
//  Created by Sean Zhang on 11/25/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, FilterViewDelegate {

    lazy var bizs: [Business] = []
    
    
    
    var item: HomeViewCell!
    var itemFrame: CGRect!
    let interactor = Interactor()
    var selectedFrame: CGRect?
    var selectedBusiness: Business?
    var navAddressTitle: String = "2590 N Moreland Blvd"
    
    lazy var grayBackgroundView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 127/255, green: 127/255, blue: 127/255, alpha: 0.75)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeFilterView)))
        return view
    }()
    
    lazy var filterButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "button-filter").withRenderingMode(.alwaysTemplate), for: .normal)
        button.backgroundColor = UIColor(red: 240/255, green: 237/255, blue: 240/255, alpha: 1)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
        button.tintColor = .black
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.clipsToBounds = true
        button.layer.cornerRadius = button.layer.frame.height/2
        button.addTarget(self, action: #selector(showFilterView), for: .touchUpInside)
        return button
    }()
    
    lazy var filterViewController: FilterViewController = {
        let vc = FilterViewController()
        vc.transitioningDelegate = self
        return vc
    }()
    
    @objc func showFilterView() {

        filterViewController.modalPresentationStyle = .overCurrentContext
        filterViewController.delegate = self
        present(filterViewController, animated: true) {
            self.view.addSubview(self.grayBackgroundView)
            
        }
    }
    
    @objc func closeFilterView() {
        print("closeFilterView")
        self.filterViewController.dismiss(animated: true) {
            self.grayBackgroundView.removeFromSuperview()
        }
    }
    
    @objc func showLocationView() {
        print("showLocationView")
        let locationViewController: LocationViewController = LocationViewController()
        locationViewController.delegate = self
        navigationController?.present(locationViewController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        DataController.sharedInstance.yelpBusinesses(term: "pizza", lat: 41.48446, long: -81.590579) { (result) in
//            self.bizs = APIClient.parseBusinesses(result: result)
//            self.collectionView?.reloadData()
//        }
        
        setupCollectionView()
        setupNavigationBar()
        setupViews()
    }
    
    func setupCollectionView()
    {
        collectionView!.register(HorizontalViewCell.self, forCellWithReuseIdentifier: "HorizontalViewCell")
        collectionView!.register(HomeViewCell.self, forCellWithReuseIdentifier: "HomeViewCell")
        collectionView!.backgroundColor = UIColor(red: 240/255, green: 237/255, blue: 240/255, alpha: 1)
        collectionView!.translatesAutoresizingMaskIntoConstraints = false
        collectionView!.contentInsetAdjustmentBehavior = .never
        NSLayoutConstraint.activate([
            collectionView!.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView!.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            collectionView!.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            collectionView!.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
    }
    
    func setupNavigationBar() {
        
    }
    
    func setupViews(){
        // navigation title
        let attributedText = NSMutableAttributedString(string: navAddressTitle, attributes: [NSAttributedStringKey.font: UIFont.italicSystemFont(ofSize: 12)])
        let titleLabel = UILabel()
        titleLabel.attributedText = attributedText
        navigationItem.titleView = titleLabel
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(showLocationView))
        navigationItem.titleView?.isUserInteractionEnabled = true
        navigationItem.titleView?.addGestureRecognizer(recognizer)
        navigationController?.navigationBar.isTranslucent = false
        let barButtonItem = UIBarButtonItem(customView: filterButton)
        navigationItem.setRightBarButton(barButtonItem, animated: true)
        filterButton.anchor(top: nil, left: nil, right: nil, bottom: nil,
                            paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0,
                            width: 30, height: 30)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 4
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (indexPath.section == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalViewCell", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeViewCell", for: indexPath) as! HomeViewCell
            //cell.biz = bizs[indexPath.row]
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
            return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // get the cell frame
        let attributes = collectionView.layoutAttributesForItem(at: indexPath)
        self.itemFrame = attributes!.frame
        self.item = collectionView.cellForItem(at: indexPath) as! HomeViewCell
        
        let detailViewController = DetailViewController()
        detailViewController.transitioningDelegate = self
        detailViewController.interactor = self.interactor
        navigationController?.present(detailViewController, animated: true, completion: nil)
    }

}

extension HomeViewController: UINavigationControllerDelegate {
    /*
        For making the pushed viewcontroller into a full screen mode, custom animation can be used here
        most of cases, please present the view controller modally. Animators can be found in the following
        files:
            - InfoAnimatedTransition.swift
            - SZAnimatedTransition.swift
    */
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if (toVC.self is DetailViewController) || (fromVC.self is DetailViewController) {
            if (toVC.self is InfoViewController) || (fromVC.self is InfoViewController){
                switch operation {
                case .push:
                    return InfoAnimatedTransition(duration: 0.5, isPresenting: true)
                default:
                    return InfoAnimatedTransition(duration: 0.5, isPresenting: false)
                }
            } else {
                guard let frame = self.selectedFrame else { return nil }
                let businessArtwork: UIImageView = UIImageView(image: #imageLiteral(resourceName: "tennesse_taco_co"))
                switch operation {
                case .push:
                    return SZAnimatedTransition(duration: 0.5, isPresenting: true, originFrame: frame, image: businessArtwork.image!)
                default:
                    return SZAnimatedTransition(duration: 0.5, isPresenting: false, originFrame: frame, image: businessArtwork.image!)
                }
            }
        }
        return nil
    }
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if (presented == self.filterViewController) {
            return PresentAnimator2()
        }
        return PresentAnimator(item: item, itemFrame: itemFrame)
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if (dismissed == self.filterViewController) {
            return DismissAnimator2()
        }
        return DismissAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}

extension HomeViewController: NavAddressDelegate {
    func setAddress(address: String) {
        navAddressTitle = address
        setupViews()
    }
}
