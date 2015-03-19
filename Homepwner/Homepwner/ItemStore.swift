//
//  ItemStore.swift
//  Homepwner
//
//  Created by Johanna Lichtman on 2/17/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import UIKit
import CoreData

class ItemStore: NSObject {
    
    var allItems: [Item] = []
    
    var allAssetTypes: [NSManagedObject] = []
    var context: NSManagedObjectContext!
    var model: NSManagedObjectModel!
    
    let itemArchivePath: String = {
        let documentsDirectories = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory = documentsDirectories.first as String
        
        return documentDirectory.stringByAppendingPathComponent("store.data")
        //return documentDirectory.stringByAppendingPathComponent("items.archive")
    }()
    
    override init(){
        super.init()
        
        if let model = NSManagedObjectModel.mergedModelFromBundles(nil){
            self.model = model
            
            let psc = NSPersistentStoreCoordinator(managedObjectModel: model)
            
            if let storeURL = NSURL(fileURLWithPath: itemArchivePath){
                
                var error: NSError?
                
                psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil, error: &error)
                
                context = NSManagedObjectContext()
                context.persistentStoreCoordinator = psc
                
                self.loadAllItems()
                self.fetchAssetTypes()
            }
        }
        
        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: "appDidEnterBackground:", name: UIApplicationDidEnterBackgroundNotification, object: nil)
    }
    
    func loadAllItems(){
        let request = NSFetchRequest()
        
        let e = NSEntityDescription.entityForName("Item", inManagedObjectContext: context)
        request.entity = e
        
        let sd = NSSortDescriptor(key: "orderingValue", ascending: true)
        request.sortDescriptors = [sd]
        
        var error: NSError?
        if let result = context.executeFetchRequest(request, error: &error) as? [Item] {
            allItems = allItems + result
        }
        else {
            println("Fetch failed: \(error!.localizedDescription)")
        }
        
    }
    
    func fetchAssetTypes(){
        let request = NSFetchRequest()
        
        let e = NSEntityDescription.entityForName("AssetType", inManagedObjectContext: context)
        request.entity = e
        
        var error: NSError?
        if let results = context.executeFetchRequest(request, error: &error) as? [NSManagedObject] {
            allAssetTypes = allAssetTypes + results
        }
        else {
            println("Fetch failed: \(error!.localizedDescription)")
        }
        
        if allAssetTypes.count == 0{
            var type: NSManagedObject
            type = NSEntityDescription.insertNewObjectForEntityForName("AssetType", inManagedObjectContext: context) as NSManagedObject
            type.setValue("Furniture", forKey: "label")
            allAssetTypes.append(type)
            
            type = NSEntityDescription.insertNewObjectForEntityForName("AssetType", inManagedObjectContext: context) as NSManagedObject
            type.setValue("Jewelry", forKey: "label")
            allAssetTypes.append(type)

            type = NSEntityDescription.insertNewObjectForEntityForName("AssetType", inManagedObjectContext: context) as NSManagedObject
            type.setValue("Electronics", forKey: "label")
            allAssetTypes.append(type)
            
        }
    }
    
    func createItem() -> Item {

        var order = 0.0
        if allItems.count == 0 {
            order = 1.0
        }
        else {
            order = allItems.last!.orderingValue + 1.0
        }
        println("Adding after \(allItems.count) items, order = \(order)")
        
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("Item", inManagedObjectContext: context) as Item
        newItem.orderingValue = order
        
        allItems.append(newItem)
        return newItem
    }
    
    func moveItemAtIndex(fromIndex: Int, toIndex: Int){
        if fromIndex == toIndex{
            return;
        }
        let movedItems = allItems[fromIndex]
        allItems.removeAtIndex(fromIndex)
        allItems.insert(movedItems, atIndex: toIndex)

        // Computing a new orderValue for the object that was moved
        var lowerBound = 0.0
        if toIndex > 0 {
            lowerBound = allItems[toIndex - 1].orderingValue
        } else {
            lowerBound = allItems[1].orderingValue - 2.0
        }
        
        var upperBound = 0.0
        // Is there an object after it in the array?
        if toIndex > allItems.count - 1{
            upperBound = allItems[toIndex + 1].orderingValue
        }
        else {
            upperBound = allItems[toIndex - 1].orderingValue
        }
        
        let newOrderValue = (lowerBound + upperBound) / 2.0
        println("Moving to order \(newOrderValue)")
        movedItems.orderingValue = newOrderValue

        
    }
    
    func removeItem(item: Item){
        if let index = find(allItems, item){
            allItems.removeAtIndex(index)
            context.deleteObject(item)
        }
    }

    
    func saveChanges() -> Bool {
        var error: NSError?
        let success = context.save(&error)
        if !success {
            println("Error saving: \(error!.localizedDescription)")
        }
        return success
    }
    
    func appDidEnterBackground(note: NSNotification){
        let success = saveChanges()
        if success {
            println("Saved all of the Items")
        }
        else {
            println("Could not save the Items")
        }
    }

   
}
