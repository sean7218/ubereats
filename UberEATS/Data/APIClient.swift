//
//  APIClient.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/13/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import Alamofire
import SwiftyJSON
import Foundation

class APIClient: NSObject {
    
    var apiKey: String
    
    init(_ apiKey: String) {
        self.apiKey = apiKey
        super.init()
    }
    
    @discardableResult
    private func performRequest(route:APIRouter, completion:@escaping (Result<Any>)->Void) -> DataRequest {
        return Alamofire.request(route).responseJSON(completionHandler: { (response: DataResponse<Any>) in
            completion(response.result)
        })
    }
    
    func getBusinesses(withTerm term: String, lat: Double, long: Double , completion:@escaping (Result<Any>)->Void) {
        performRequest(route: APIRouter.business(term: term, lat: lat, long: long), completion: completion)
    }
    
    func parseBusinesses(result: Result<Any>) -> [Biz] {
        var bizs: [Biz] = []
        let value = result.value
        let json = JSON(value ?? "[]")
        for (_, obj) in json {
            let jsonString = obj.rawString(.utf8, options: .prettyPrinted)
            let jsonData = jsonString?.data(using: .utf8)
            let decoder = JSONDecoder()
            let business = try! decoder.decode(Biz.self, from: jsonData!)
            bizs.append(business)
        }
        return bizs
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
    
    func yelpBusinesses(term: String, lat: Float, long: Float, completion: @escaping (Result<Any>) -> Void) {
        let bear = self.apiKey
        let headers: HTTPHeaders = ["x-access-token": bear]
        let params: Parameters = ["term": term, "lat": lat, "long": long]
        Alamofire.request("https://api.zxsean.com/yelp", method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            if let _ = response.result.value {
                print("yelpBusiness Called with status code: ")
                print(response.response?.statusCode ?? 0)
                completion(response.result)
            } else {
                print("No json from the yelp endpoint")
            }
        }
    }
}
