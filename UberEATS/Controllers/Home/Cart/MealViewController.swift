//
//  MealViewController.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/3/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class MealItemViewController: UIViewController {
    
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "The Classic Quesadilla"
        return label
    }()
    
    var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "598-848 Cal. Jack cheese and your choice of chicken, steak, pork carnitas, taco beef, fish or farm-fresh veggies, and beans. served with sour cream and salsa. 133 Cal."
        label.numberOfLines = 4
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tb = UITableView(frame: CGRect.zero)
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(MealItemTableViewCell.self, forCellReuseIdentifier: "MealItemCell")
        tb.delegate = self
        tb.dataSource = self
        return tb
    }()
    
    var cancelButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleDismiss), for: UIControlEvents.touchUpInside)
        button.setImage(#imageLiteral(resourceName: "button-pressed"), for: UIControlState.normal)
        return button
    }()
    
    var shareButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "button-normal"), for: .normal)
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
        return button
    }()
    
    @objc func handleDismiss(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(cancelButton)
        cancelButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                          right: nil, bottom: nil,
                          paddingTop: 10, paddingLeft: 10, paddingRight: 0, paddingBottom: 0,
                          width: 50, height: 50)
        
        view.addSubview(shareButton)
        shareButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.rightAnchor,
                            right: nil, bottom: nil,
                            paddingTop: 10, paddingLeft: 0, paddingRight: 10, paddingBottom: 0,
                            width: 50, height: 50)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: cancelButton.bottomAnchor, left: view.leftAnchor,
                          right: view.rightAnchor, bottom: nil,
                          paddingTop: 10, paddingLeft: 0, paddingRight: 0, paddingBottom: 0,
                          width: 0, height: 100)
        view.addSubview(detailLabel)
        detailLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor,
                           right: view.rightAnchor, bottom: nil,
                           paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0,
                           width: 0, height: 100)
        view.addSubview(tableView)
        tableView.anchor(top: detailLabel.bottomAnchor, left: view.leftAnchor,
                         right: view.rightAnchor, bottom: view.bottomAnchor,
                         paddingTop: 10, paddingLeft: 0, paddingRight: 0, paddingBottom: 20,
                         width: 0, height: 0)
    }
}

extension MealItemViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealItemCell", for: indexPath) as! MealItemTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

class MealItemTableViewCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
