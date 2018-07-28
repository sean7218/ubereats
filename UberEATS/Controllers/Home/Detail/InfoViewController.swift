//
//  InfoViewController.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/28/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    var mapView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "InfoCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func setupViews(){
        
    }
}

extension InfoViewController:  UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell")
        cell?.backgroundColor = .red
        return cell!
    }
    
}
