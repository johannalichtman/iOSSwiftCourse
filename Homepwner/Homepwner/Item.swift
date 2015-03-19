//
//  Item.swift
//  Homepwner
//
//  Created by Johanna Lichtman on 2/20/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import Foundation
import CoreData

class Item: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var serialNumber: String?
    @NSManaged var valueInDollars: Int
    @NSManaged var dateCreated: NSDate
    @NSManaged var itemKey: String
    @NSManaged var orderingValue: Double
    @NSManaged var assetType: NSManagedObject
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        dateCreated = NSDate()
        
        // Create an NSUUID object and get its string representation
        let uuid = NSUUID()
        let key = uuid.UUIDString
        itemKey = key
        
        name = ""
        valueInDollars = 0
        
    }
}
