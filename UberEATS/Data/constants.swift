//
//  constants.swift
//  UberEATS
//
//  Created by Sean Zhang on 8/13/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import Foundation


struct K {
    struct bear {
        static let key =  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNTM0MjYwNTE4LCJleHAiOjE1MzQzNDY5MTh9.RbDmu9PzNPD_P0nmR1Gc0Qgl8tlYbulqTdljvvg4VN4"
    }
    
    struct ProductionServer {
        static let baseURL = "https://api.zxsean.com"
    }
    
    struct APIParameterKey {
        static let password = "password"
        static let email = "email"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

extension DateFormatter {
    static var businessDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
}

