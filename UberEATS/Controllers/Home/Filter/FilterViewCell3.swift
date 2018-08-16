//
//  FilterViewCell3.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/23/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class FilterViewCell3: UICollectionViewCell {
    
    let dietOptions: [String] = ["Vegetarian", "Vegan", "Gluten-free", "Halal"];
    let dietImages:[String] = ["filter_vegetarian", "filter_vegan", "filter_glutenfree", "filter_hala"];
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = false
        let imgview = UIImageView()
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(FilterTableCell.self, forCellReuseIdentifier: "FilterTableCell")
        self.tableView.separatorColor = .white
    }
    
    fileprivate func setupViews(){
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            ])
    }
}

extension FilterViewCell3: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableCell", for: indexPath) as! FilterTableCell
        cell.tl.text = dietOptions[indexPath.row]
        cell.iv.image = UIImage(imageLiteralResourceName: dietImages[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
