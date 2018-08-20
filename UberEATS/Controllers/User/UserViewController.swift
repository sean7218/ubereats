//
//  UserViewController.swift
//  UberEATS
//
//  Created by Sean Zhang on 11/25/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    var delegate: OnboardingDelegate?
    
    var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logout", for: UIControlState.normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "button_background"), for: UIControlState.normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "button_background_white"), for: UIControlState.highlighted)
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.setTitleColor(UIColor.blue, for: UIControlState.highlighted)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(logout), for: UIControlEvents.touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        setupViews()
    }
    
    fileprivate func setupViews(){
        view.addSubview(logoutButton)
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            logoutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            logoutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            logoutButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    @objc func logout() {
        print("logging user out")
        let userDefaults = UserDefaults.standard
        userDefaults.set(false, forKey: "isSignedin")
        delegate?.checkUserAuth()
    }
}
