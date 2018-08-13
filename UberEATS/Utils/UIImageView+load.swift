//
//  UIImageView+load.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/13/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
