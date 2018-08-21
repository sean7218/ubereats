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
import CoreData


class DataController: NSObject {
    
    static let sharedInstance = DataController()

    var managedObjectContext: NSManagedObjectContext
    
    override init() {

        guard let modelURL = Bundle.main.url(forResource: "UberEATS", withExtension: "momd") else {
            fatalError("Error Loading model from bundle")
        }
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error creating model from given url")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        let urls = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)
        let folderURL = urls[urls.endIndex - 1]
        let storeURL = folderURL.appendingPathComponent("business.sqlite")
        
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            fatalError("Error while loading the persistant store with sqlite")
        }

    }
    
    func mockData(){
        let entity = NSEntityDescription.entity(forEntityName: "Business", in: managedObjectContext)!
        let business = NSManagedObject(entity: entity, insertInto: managedObjectContext)
        business.setValue("On the Rise", forKey: "name")
        business.setValue("https://github.com/sean7218/ubereats", forKey: "url")
        business.setValue(1.3, forKey: "rating")
        business.setValue(200, forKey: "review_count")
        business.setValue("$$$$", forKey: "price")
        do {
            try managedObjectContext.save()
            
        } catch let err as NSError {
            print(err.description)
        }
    }
    
    func preloadData(apiClient: APIClient) {
        apiClient.yelpBusinesses(term: "pizza", lat: 41.48446, long:  -81.590579) { (result) in
            let busineses = apiClient.parseBusinesses(result: result)
            print(busineses)
        }
    }
    
    func fetchDate() {
        let fetchRequest =  NSFetchRequest<NSManagedObject>(entityName: "Business")

        do {
            let businesses =  try managedObjectContext.fetch(fetchRequest)
            print(businesses)
            for item in businesses {
                let biz = item as! Business
                print(biz.name ?? "N/A")
            }
        } catch let err as NSError {
            print(err.description)
        }
    }
}
