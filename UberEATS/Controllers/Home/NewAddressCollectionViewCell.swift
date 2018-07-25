//
//  NewAddressCollectionViewCell.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/24/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class NewAddressCollectionViewCell: UICollectionViewCell {

    let geoCoder: GMSGeocoder = {
        let encoder =  GMSGeocoder.init()
        return encoder
    }()
    
    let placeClient: GMSPlacesClient! = {
        let client = GMSPlacesClient.shared()
        return client
    }()
    
    lazy var addressImageView: UIImageView = {
        let image: UIImage = #imageLiteral(resourceName: "address-1").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var addressTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints  = false
        textField.placeholder = "Address"
        textField.addTarget(self, action: #selector(searchAddress(_:)), for: UIControlEvents.editingChanged)
        return textField
    }()

    @objc func searchAddress(_ sender: UITextField) {
        print("address input changed")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
//        let latitude: CLLocationDegrees = 41.505493;
//        let longitude: CLLocationDegrees =  -81.681290;
//        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//        geoCoder.reverseGeocodeCoordinate(coordinate) { (gmsReverseGeocodeResp, error) in
//            let firstRes = gmsReverseGeocodeResp?.firstResult()
//            print(firstRes?.locality ?? "Default Address")
//        }
        
//        let query: String = "moreland"
//        let nearLeft = CLLocationCoordinate2D(latitude: 41.479168 , longitude: -81.830476)
//        let nearRight = CLLocationCoordinate2D(latitude: 41.467592, longitude: -81.486467)
//        let farLeft = CLLocationCoordinate2D(latitude: 41.475052,  longitude: -82.008660)
//        let farRight = CLLocationCoordinate2D(latitude: 41.454985, longitude: -81.311715)
//        let region: GMSVisibleRegion = GMSVisibleRegion(nearLeft: nearLeft, nearRight: nearRight, farLeft: farLeft, farRight: farRight)
//        let bound: GMSCoordinateBounds = GMSCoordinateBounds(region: region)
//        placeClient.autocompleteQuery(query, bounds: bound, filter: nil) { (preds, error) in
//            //  ([GMSAutocompletePrediction]?, Error?)
//            if (error != nil) {
//                print(error.debugDescription)
//            }
//            if (error == nil && preds != nil) {
//                print("Getting Results")
//                let _ = preds?.map({ (pred) -> Void in
//                    print(pred.attributedFullText.string)
//                })
//            }
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        backgroundColor = .white
        addSubview(addressImageView)
        NSLayoutConstraint.activate([
            addressImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            addressImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            addressImageView.widthAnchor.constraint(equalToConstant: 20),
            addressImageView.heightAnchor.constraint(equalToConstant: 20)
            ])
        addSubview(addressTextField)
        NSLayoutConstraint.activate([
            addressTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            addressTextField.leftAnchor.constraint(equalTo: addressImageView.rightAnchor, constant: 15),
            addressTextField.widthAnchor.constraint(equalToConstant: frame.width - 30),
            addressTextField.heightAnchor.constraint(equalToConstant: 20)
            ])
    }
}
