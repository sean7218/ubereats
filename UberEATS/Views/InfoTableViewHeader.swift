//
//  InfoTableViewHeader.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/30/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class InfoTableViewHeader: UITableViewHeaderFooterView {
    
    var infoTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Info"
        return label
    }()
    
    var address: String? {
        didSet {
            addressLabel.text = address
        }
    }
    
    var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        label.text = "1500 Mass Ave NW, APT 214, Washington DC, 20005"
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(infoTitle)
        NSLayoutConstraint.activate([
            infoTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            infoTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            infoTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            infoTitle.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        addSubview(addressLabel)
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: infoTitle.bottomAnchor, constant: 5),
            addressLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 35),
            addressLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -35),
            addressLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
}
