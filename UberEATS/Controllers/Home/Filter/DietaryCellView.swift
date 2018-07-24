//
//  DietaryCellView.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/23/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class DietaryCellView: UITableView, UITableViewDelegate,  UITableViewDataSource {
    
    let dietOptions: [String] = ["Vegetarian", "Vegan", "Gluten-free", "Hala"];
    let dietImages:[String] = ["rec.png", "pop.png", "rate.png", "rate.png"];
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DietaryCellViewCell", for: indexPath) as! DietaryCellViewCell
        cell.nameLabel.text = dietOptions[indexPath.row];
        cell.dietImageView.image = UIImage(named: dietImages[indexPath.row])
        return cell
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.register(DietaryCellViewCell.self, forCellReuseIdentifier: "DietaryCellViewCell")
        self.isScrollEnabled = false
        self.separatorStyle = UITableViewCellSeparatorStyle.none
        self.backgroundColor = UIColor(red: 244/255, green: 140/255, blue: 66/250, alpha: 0.5)
        delegate = self
        dataSource = self
        self.rowHeight = 150 / 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DietaryCellViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dietImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "home-page-50"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(dietImageView)
        NSLayoutConstraint.activate([
            dietImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            dietImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            dietImageView.widthAnchor.constraint(equalToConstant: 50),
            dietImageView.heightAnchor.constraint(equalToConstant: 50)
            ])
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            nameLabel.leftAnchor.constraint(equalTo: dietImageView.rightAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalToConstant: self.frame.width - 70),
            nameLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    
    // todo: when selected - change the color:
}

