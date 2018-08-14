//
//  DataController.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/25/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class DataController {
    
    static let sharedInstance = DataController()
    
    init() {
        // TODO: Setup Keys
    }
    
    func getLocalJSON(fileName: String) -> JSON? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let jsonObj = try JSON(data: data)
                let bizName = jsonObj["name"].string
                let bizLocation = jsonObj["location"]["address1"].string
                print("get the data success: \(String(describing: bizName)) @ \(String(describing: bizLocation))")
                return jsonObj
            } catch let error {
                print("error occur when getting the data")
                print(error.localizedDescription)
            }
        } else {
            print("invalid filename/path")
        }
        return nil
    }
    
    func getNetworkJSON(url: String) {
        Alamofire.request(url).responseJSON { response in
            // (DataResponse<Any>) -> Void
            if let json =  response.result.value {
                print("JSON FROM NETWORK: \(json)")
            } else {
                print("NO JSON FROM NETOWKR....")
            }
        }
    }
    
    func yelpBiz(key: String, lat: Float, long: Float) {
        let bear = K.bear.key
        let headers: HTTPHeaders = ["x-access-token": bear]
        let params: Parameters = ["key": key, "lat": lat, "long": long]
        Alamofire.request("https://api.zxsean.com/yelp", method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            if let json = response.result.value {
                print(json)
            } else {
                print("No json from the yelp endpoint")
            }
        }
    }
}
