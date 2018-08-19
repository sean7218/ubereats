//
//  OnboardingViewController.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/18/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var emailTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "email"
        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "password"
        return textField
    }()
    
    var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: UIControlState.normal)
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    fileprivate func setupViews(){
        view.backgroundColor = .white
        view.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
        view.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}

