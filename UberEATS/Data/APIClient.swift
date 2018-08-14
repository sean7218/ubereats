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
        print(2)
        return Alamofire.request(route).responseJSON(completionHandler: { (response: DataResponse<Any>) in
            print(3)
            completion(response.result)
        })
    }
    

    static func getBusinesses(completion:@escaping (Result<Any>)->Void) {
        print(1)
        performRequest(route: APIRouter.business, completion: completion)
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
