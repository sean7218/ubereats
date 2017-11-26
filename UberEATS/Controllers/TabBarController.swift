//
//  TabBarController.swift
//  UberEATS
//
//  Created by Sean Zhang on 11/25/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    lazy var homeNavController: UINavigationController = {
        let nav = UINavigationController(rootViewController: self.homeViewController)
        return nav
    }()
    
    lazy var homeViewController: HomeViewController = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let vc = HomeViewController(collectionViewLayout: layout)
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.contacts, tag: 1)
        return vc
    }()
    
    let searchViewController: SearchViewController = {
        let vc = SearchViewController()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.downloads, tag: 2)
        return vc
    }()
    
    lazy var orderViewController: OrderViewController = {
        let vc = OrderViewController()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.favorites, tag: 3)
        return vc
    }()
    let userViewController: UserViewController = {
        let vc = UserViewController()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.history, tag: 4)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setViewControllers([
            homeNavController,
            searchViewController,
            orderViewController,
            userViewController], animated: true)
    }
}
