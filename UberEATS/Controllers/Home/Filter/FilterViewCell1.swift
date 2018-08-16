//
//  PriceRange.swift
//  UberEATS
//
//  Created by Sean Zhang on 11/30/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class FilterViewCell1: UICollectionViewCell {
    
    let sortOptions: [String] = ["Recommended", "Most popular", "Rating", "Delivery time"];
    let sortImages:[String] = ["filter_recommended", "filter_popular", "filter_rating", "filter_delivery"];
    
    var delegate: FilterSelectDelegate?
    
    lazy var tableView: UITableView = {
       let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FilterTableCell.self, forCellReuseIdentifier: "FilterTableCell")
        tableView.separatorColor = UIColor.white
        tableView.isScrollEnabled = false
    }
    
    fileprivate func setupViews(){
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.heightAnchor.constraint(equalToConstant: frame.height)
        ])
    }
}

extension FilterViewCell1: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableCell", for: indexPath) as! FilterTableCell
        cell.tl.text = sortOptions[indexPath.row]
        cell.iv.image = UIImage(imageLiteralResourceName: sortImages[indexPath.row])
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selected(section: 0, row: indexPath.row)
        print("FilterViewCell1 selected: \(indexPath.row)")
    }
}

protocol FilterSelectDelegate {
    func selected(section: Int, row: Int) -> Void
}

class FilterTableCell: UITableViewCell {
    
    var iv: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var tl: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(iv)
        NSLayoutConstraint.activate([
            iv.centerYAnchor.constraint(equalTo: centerYAnchor),
            iv.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            iv.widthAnchor.constraint(equalToConstant: 24),
            iv.heightAnchor.constraint(equalToConstant: 24)
            ])
        addSubview(tl)
        NSLayoutConstraint.activate([
            tl.centerYAnchor.constraint(equalTo: centerYAnchor),
            tl.leftAnchor.constraint(equalTo: iv.rightAnchor, constant: 10),
            tl.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            tl.heightAnchor.constraint(equalToConstant: 24)
            ])
    }
}

