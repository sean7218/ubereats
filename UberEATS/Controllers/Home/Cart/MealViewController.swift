//
//  MealViewController.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/3/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class MealItemViewController: UIViewController {
    
    

    
    lazy var tableView: UITableView = {
        let tb = UITableView(frame: CGRect.zero)
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(MealItemTableViewCell.self, forCellReuseIdentifier: "MealItemCell")
        tb.register(MealItemTitleCell.self, forCellReuseIdentifier: "MealItemTitleCell")
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCellEmpty")
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
        button.setImage(#imageLiteral(resourceName: "button-pressed"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(handleShare), for: UIControlEvents.touchUpInside)
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
    
    @objc func handleShare(){
        print("Sharing button pressed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
        view.addSubview(cancelButton)
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            cancelButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            cancelButton.widthAnchor.constraint(equalToConstant: 50),
            cancelButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        view.addSubview(shareButton)
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            shareButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            shareButton.widthAnchor.constraint(equalToConstant: 50),
            shareButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}

extension MealItemViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        } else {
            return 4
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MealItemTitleCell", for: indexPath) as! MealItemTitleCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MealItemCell", for: indexPath) as! MealItemTableViewCell
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
        if (section == 0) {
            return 0
        }
        return 20
    }
    
}

class MealItemTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Crab Meat"
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "+1.03"
        return label
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -80),
            nameLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            priceLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 10),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            priceLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}

class MealItemTableHeaderView: UITableViewHeaderFooterView {
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class MealItemTitleCell: UITableViewCell {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "The Classic Quesadilla"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    var seperator: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor.black
        return line
    }()
    
    var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "598-848 Cal. Jack cheese and your choice of chicken, steak, pork carnitas, taco beef, fish or farm-fresh veggies, and beans. served with sour cream and salsa. 133 Cal."
        label.numberOfLines = 4
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 100)
            ])
        addSubview(seperator)
        NSLayoutConstraint.activate([
            seperator.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            seperator.widthAnchor.constraint(equalToConstant: 150),
            seperator.heightAnchor.constraint(equalToConstant: 1)
            ])
        addSubview(detailLabel)
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: seperator.bottomAnchor, constant: 10),
            detailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            detailLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            detailLabel.heightAnchor.constraint(equalToConstant: 100)
            ])
    }
}

















