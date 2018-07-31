//
//  InfoViewController.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/28/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class InfoViewController: UIViewController {
    
    lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        return locationManager
    }()
    
    var placesClient: GMSPlacesClient!
    var selectedPlace: GMSPlace?
    var currentPosition: CLLocation?
    var zoomLevel: Float = 15.0
    var mapView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tableView: InfoTableView = {
        let tableView = InfoTableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.isUserInteractionEnabled = false
        tableView.separatorColor = .gray
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: "InfoTableViewCell")
        tableView.register(InfoTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "InfoTableViewHeaderCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupViews()
        locationManager.startUpdatingLocation()
    }
    func setupMapView() {

        let camera = GMSCameraPosition.camera(withTarget: CLLocationCoordinate2D.init(latitude: 38.906442, longitude: -77.035396), zoom: 15)
        let mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: self.navigationController?.navigationBar.frame.height ?? 0, width: view.frame.width, height: 250), camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let marker = GMSMarker()
        placesClient = GMSPlacesClient.shared()
        placesClient.lookUpPlaceID("ChIJE_Jo2MG3t4kRDmuaghjExpo") { (place, err) in
            marker.position = (place?.coordinate)!
            marker.title = place?.name
            marker.snippet = place?.formattedAddress
            marker.map = mapView
        }
        self.mapView = mapView
    }
    func setupViews() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            mapView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            ])
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

extension InfoViewController:  UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell") as! InfoTableViewCell
        cell.day = "Sundauy"
        cell.hour = "10:00AM - 5:00PM    Breakfast 10:00AM - 5:00PM    Lunch   10:00AM - 5:00PM    Dinner"
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InfoTableViewHeaderCell") as! InfoTableViewHeader
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension InfoViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        
        let _ = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
        
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
}
