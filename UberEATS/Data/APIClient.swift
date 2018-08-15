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

class APIClient {
    @discardableResult
    private static func performRequest(route:APIRouter, completion:@escaping (Result<Any>)->Void) -> DataRequest {
        return Alamofire.request(route).responseJSON(completionHandler: { (response: DataResponse<Any>) in
            completion(response.result)
        })
    }
    
    static func getBusinesses(withTerm term: String, lat: Double, long: Double , completion:@escaping (Result<Any>)->Void) {
        performRequest(route: APIRouter.business(term: term, lat: lat, long: long), completion: completion)
    }
    
    static func parseBusinesses(result: Result<Any>) -> [Business] {
        var bizs: [Business] = []
        let value = result.value
        let json = JSON(value ?? "[]")
        for (_, obj) in json {
            let jsonString = obj.rawString(.utf8, options: .prettyPrinted)
            let jsonData = jsonString?.data(using: .utf8)
            let decoder = JSONDecoder()
            let business = try! decoder.decode(Business.self, from: jsonData!)
            bizs.append(business)
        }
        return bizs
    }
}
