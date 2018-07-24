//
//  LocationViewController.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/24/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.allowsMultipleSelection = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor(red: 241/255, green: 242/255, blue: 244/255, alpha: 1)
        collectionView.register(NewAddressCollectionViewCell.self, forCellWithReuseIdentifier: "NewAddressCell")
        collectionView.register(AddressCollectionViewCell.self, forCellWithReuseIdentifier: "AddressCell")
        collectionView.register(WhenCollectionViewCell.self, forCellWithReuseIdentifier: "WhenCell")
        
        return collectionView
    }()
    
    func convertUIImageToCGImage(inputImage: UIImage) -> CGImage! {
        let ciImg = CIImage(image: inputImage)
        let context = CIContext(options: nil)
        let cgImg = context.createCGImage(ciImg!, from: (ciImg?.extent)!)
        return cgImg
    }
    
    lazy var navigationBar: UINavigationBar = {
        let bar = UINavigationBar(frame: CGRect.zero)
        
        let navItem = UINavigationItem(title: "Delivery Details")
        let cancelButton = UIButton(type: UIButtonType.system)
        
        // convert images so it can be scaled
        let cgImg = convertUIImageToCGImage(inputImage: #imageLiteral(resourceName: "button-pressed"))
        let scImg = UIImage(cgImage: cgImg!, scale: 2, orientation: UIImageOrientation.right)

        // finish setup
        cancelButton.setBackgroundImage(scImg.withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: UIControlState.normal)
        cancelButton.addTarget(self, action: #selector(closeLocationViewController(_:)), for: UIControlEvents.touchUpInside)
        let cancelItem = UIBarButtonItem(customView: cancelButton)
        navItem.leftBarButtonItem = cancelItem
        bar.setItems([navItem], animated: false)
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.isTranslucent = false
        bar.backgroundColor = UIColor.lightGray
        return bar
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        let doneString = NSAttributedString(string: "DONE")
        button.setAttributedTitle(doneString, for: UIControlState.normal)
        button.addTarget(self, action: #selector(doneLocationViewControoler(_:)), for: UIControlEvents.touchUpInside)
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = UIColor(red: 67/255, green: 163/255, blue: 45/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func closeLocationViewController(_ sender: UIBarButtonItem){
        dismiss(animated: true) {
            //
        }
    }
    
    @objc func doneLocationViewControoler(_ sender: UIButton) {
        dismiss(animated: true) {
            //
        }
    }
    
    override func viewDidLoad() {
        setupViews()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (section == 1) {
            return 3
        }
        if (section == 2) {
            return 2
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddressCell", for: indexPath) as! AddressCollectionViewCell
        if (indexPath.section == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewAddressCell", for: indexPath) as! NewAddressCollectionViewCell
            return cell
        }
        if (indexPath.section == 1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddressCell", for: indexPath) as! AddressCollectionViewCell
            if (indexPath.row == 0) {
                cell.addressImage = #imageLiteral(resourceName: "current-1")
                cell.addressTitle = "Current"
                cell.address = "2590 North Moreland Blvd, apt E31, Shaker Heights 44120"
                cell.delivery = "Deliver to door"
            }
            if (indexPath.row == 1) {
                cell.addressImage = #imageLiteral(resourceName: "home-1")
                cell.addressTitle = "HOME"
                cell.address = "10901 Keene Road, Louisville, Kentucky 40241"
                cell.delivery = "Deliver to door"
            }
            if (indexPath.row == 2) {
                cell.addressImage = #imageLiteral(resourceName: "history-1")
                cell.addressTitle = "1500 Mass Ave NW"
                cell.address = "1500 Mass Ave NW APT 241, Washginton, DC 20005"
                cell.delivery = "Deliver to door"
            }
            return cell
        }
        if (indexPath.section == 2) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WhenCell", for: indexPath) as! WhenCollectionViewCell
            if (indexPath.row == 0) {
                cell.whenIMG = #imageLiteral(resourceName: "clock-1")
                cell.whenTXT = "As soon as possible"
            }
            if (indexPath.row == 1) {
                cell.whenIMG = #imageLiteral(resourceName: "calendar-1")
                cell.whenTXT = "Schedule an order"
            }
            return cell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (indexPath.section == 0 || indexPath.section == 2){
            return CGSize(width: view.frame.width, height: 50)
        }
        return CGSize(width: view.frame.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedRows: [IndexPath] = collectionView.indexPathsForSelectedItems!
        for selectedRow in selectedRows {
            if (selectedRow.section == indexPath.section) && (selectedRow.row != indexPath.row) {
                self.collectionView.deselectItem(at: selectedRow, animated: false)
            }
        }
    }
    
    func setupViews(){
        view.backgroundColor = UIColor.white
        view.addSubview(navigationBar)
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            navigationBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0),
//            navigationBar.heightAnchor.constraint(equalToConstant: 150),
            ])
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
        
        view.addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            doneButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            doneButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0),
            doneButton.heightAnchor.constraint(equalToConstant: 40),
            ])
    }
}


