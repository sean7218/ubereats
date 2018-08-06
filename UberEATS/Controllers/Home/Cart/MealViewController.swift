//
//  MealViewController.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/3/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class MealItemViewController: UIViewController {
    
    var blackBar: Bool = true
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if (blackBar) {
            return .default
        } else {
            return .lightContent
        }
    }
    
    var statusBarView: UIView = {
        let view = UIView(frame: UIApplication.shared.statusBarFrame)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var navigationBar: UINavigationBar = {
        let bar = UINavigationBar()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.backgroundColor = .white
        bar.isTranslucent = false
        let cancelBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "button-cancel-cross").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
        let shareBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "button-share32").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleShare))
        let navItem = UINavigationItem()
        
        navItem.leftBarButtonItem = cancelBarButtonItem
        navItem.rightBarButtonItem = shareBarButtonItem
        bar.items = [navItem]
        return bar
    }()
    
    lazy var tableView: UITableView = {
        let tb = UITableView(frame: CGRect.zero, style: .plain)
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(MealItemTableViewCell.self, forCellReuseIdentifier: "MealItemCell")
        tb.register(MealItemTitleCell.self, forCellReuseIdentifier: "MealItemTitleCell")
        tb.register(MealItemQuantityCell.self, forCellReuseIdentifier: "MealItemQuantityCell")
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCellEmpty")
        tb.delegate = self
        tb.dataSource = self
        tb.backgroundColor = .white
        tb.separatorColor = .lightGray
        tb.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        tb.allowsMultipleSelection = true
        tb.contentInsetAdjustmentBehavior = .never
        
        return tb
    }()
    
    var cancelButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleDismiss), for: UIControlEvents.touchUpInside)
        button.setImage(#imageLiteral(resourceName: "button-cancel-cross"), for: UIControlState.normal)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return button
    }()
    
    var shareButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "button-share32"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(handleShare), for: UIControlEvents.touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return button
    }()
    
    var quantityButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    var addCartButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 71/255, green: 162/255, blue: 25/255, alpha: 1)
        button.setTitle("Add to Cart", for: UIControlState.normal)
        return button
    }()
    
    @objc func handleDismiss(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleShare(){
        print("Sharing button pressed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavBar()
    }
    
    func setupViews() {
        view.addSubview(addCartButton)
        NSLayoutConstraint.activate([
            addCartButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            addCartButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            addCartButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            addCartButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: addCartButton.topAnchor, constant: 0)
            ])
        view.addSubview(cancelButton)
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            cancelButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            cancelButton.widthAnchor.constraint(equalToConstant: 50),
            cancelButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        view.addSubview(shareButton)
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            shareButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            shareButton.widthAnchor.constraint(equalToConstant: 50),
            shareButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    func setupNavBar(){
        view.addSubview(navigationBar)
        NSLayoutConstraint.activate([
            navigationBar.bottomAnchor.constraint(equalTo: view.topAnchor),
            navigationBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            navigationBar.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0),
            ])
        view.addSubview(statusBarView)
    }
    
}

extension MealItemViewController {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pos = scrollView.contentOffset.y
        if (pos > 44) {
            blackBar = true
            setNeedsStatusBarAppearanceUpdate()
            UIView.animate(withDuration: 0.5) {
                self.statusBarView.frame.origin = CGPoint(x: 0, y: 0)
                self.navigationBar.frame.origin = CGPoint(x: 0, y: UIApplication.shared.statusBarFrame.height)
            }
        }
        
        if (pos < 44) {
            blackBar = false
            setNeedsStatusBarAppearanceUpdate()
            UIView.animate(withDuration: 0.4) {
                self.statusBarView.frame.origin = CGPoint(x: 0, y: -UIApplication.shared.statusBarFrame.height-self.navigationBar.frame.height)
                self.navigationBar.frame.origin = CGPoint(x: 0, y: -self.navigationBar.frame.height)
                
            }
        }
    }
}

extension MealItemViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) || (section == 9){
            return 1
        } else {
            return 4
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MealItemTitleCell", for: indexPath) as! MealItemTitleCell
            return cell
        } else if (indexPath.section == 9) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MealItemQuantityCell", for: indexPath) as! MealItemQuantityCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MealItemCell", for: indexPath) as! MealItemTableViewCell
            if (indexPath.section == 2) || (indexPath.section == 4) {
                cell.singleSelectSectinon = true
            } else {
                cell.singleSelectSectinon = false
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0){
            return 300
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return nil
        } else {
            return "someHeaderName"
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) || (section == 9){
            return 0
        }
        return 20
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! MealItemTableViewCell
        cell.isSelected = true
        // define sections that are single select
        let singleSelectSections = [2, 4]
        if (singleSelectSections.contains(indexPath.section)) {
            print("selected section: \(indexPath.section) and row: \(indexPath.row)")
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
            let rows = tableView.numberOfRows(inSection: indexPath.section)
            for i in 0...rows {
                if i != indexPath.row {
                    tableView.deselectRow(at: IndexPath(row: i, section: indexPath.section), animated: false)
                }
            }
        }
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if (indexPath.section != 0 && indexPath.section != 9) {
            let cell = tableView.cellForRow(at: indexPath) as! MealItemTableViewCell
            cell.isSelected = false
        }
    }
    
    func enableSingleSelection(AtSection section: Int) {
        
    }
}
























