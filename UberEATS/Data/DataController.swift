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
    
    var fetchResultController: NSFetchedResultsController<Business>!
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
        let storeURL = folderURL.appendingPathComponent("dataModel.sqlite")
        
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            fatalError("Error while loading the persistant store with sqlite")
        }
        
    }
    
    func createFetchedResultsController(){
        let fetchRequest: NSFetchRequest = NSFetchRequest<Business>(entityName: "Business")
        let sortDescriptor: NSSortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: DataController.sharedInstance.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        do {
            try fetchResultController.performFetch()
        } catch let error as NSError{
            print("Fetching Error: \(error.localizedDescription)")
        }
        
    }
    
    func mockData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext =  appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Business", in: managedContext)!
        let business = NSManagedObject(entity: entity, insertInto: managedContext)
        business.setValue("On the Rise", forKey: "name")
        business.setValue("https://github.com/sean7218/ubereats", forKey: "url")
        business.setValue(1.3, forKey: "rating")
        business.setValue(200, forKey: "review_count")
        business.setValue("$$$$", forKey: "price")
        
        do {
            try managedContext.save()
            
        } catch let err as NSError {
            print(err.description)
        }
        
    }
    
    func preloadData() {
        
    }
    
    func deleteData() {
        
    }
    
    func fetchDate() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext =  appDelegate.persistentContainer.viewContext
        
        let fetchRequest =  NSFetchRequest<NSManagedObject>(entityName: "Business")

        do {
            let businesses =  try managedContext.fetch(fetchRequest)
            print(businesses)
        } catch let err as NSError {
            print(err.description)
        }
    }
}

extension DataController: NSFetchedResultsControllerDelegate {

    
    
}
