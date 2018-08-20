//
//  Restaurant.swift
//  UberEATS
//
//  Created by Sean Zhang on 7/25/18.
//  Copyright © 2018 Sean Zhang. All rights reserved.
//

import Foundation
import CoreData


struct Biz: Codable {
    var name: String?
    var price: String?
    var rating: Double?
    var review_count: Int?
    var url: String?
}

@objc(Business)
public class Business: NSManagedObject {
    
    static let fetchRequest1: NSFetchRequest<Business> = {
        let fr = NSFetchRequest<Business>(entityName: "Business")
        let sd = NSSortDescriptor(key: "rating", ascending: true)
        fr.sortDescriptors = [sd]
        return fr
    }()
    
    static let fetchRequest2: NSFetchRequest<Business> = {
        let fr = NSFetchRequest<Business>(entityName: "Business")
        let sd = NSSortDescriptor(key: "name", ascending: true)
        fr.sortDescriptors = [sd]
        return fr
    }()
}

extension Business {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Business> {
        return NSFetchRequest<Business>(entityName: "Business")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var url: String?
    @NSManaged public var rating: NSNumber?
    @NSManaged public var review_count: NSNumber?
    @NSManaged public var price: String?
    
}
