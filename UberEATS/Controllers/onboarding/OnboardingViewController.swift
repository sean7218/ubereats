//
//  OnboardingViewController.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/18/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit
import Alamofire

class OnboardingViewController: UIViewController {
    
    var delegate: OnboardingDelegate?
    
    var emailTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "email"
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.leftView = padding
        textField.leftViewMode = .always
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 25

        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "password"
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.leftView = padding
        textField.leftViewMode = .always
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 25
        textField.layer.masksToBounds = true
        return textField
    }()
    
    var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: UIControlState.normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "button_background"), for: UIControlState.normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "button_background_white"), for: UIControlState.highlighted)
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.setTitleColor(UIColor.blue, for: UIControlState.highlighted)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(login), for: UIControlEvents.touchUpInside)
        
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
    
    @objc func login() {
        print("Loggin network call fired")
        let userDefault = UserDefaults.standard
        guard let email = emailTextField.text else { print("no user email"); return }
        guard let password = passwordTextField.text else { print("no password"); return }
        let url = try! "https://api.zxsean.com/user/login".asURL()
        let params: Parameters = ["email": email, "password": password]
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            let results = response.result.value
            print(results)
        }
        print(email)
        if (email == "sean@gmail.com") {
            print("email is correct")
            userDefault.set(true, forKey: "isSignedin")
            delegate?.checkUserAuth()
        } else {
            print("incorrect email")
            userDefault.set(false, forKey: "isSignedin")
            //delegate?.checkUserAuth()
        }
    }
}
