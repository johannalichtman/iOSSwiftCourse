//
//  Item.swift
//  RandomItems
//
//  Created by Johanna Lichtman on 2/16/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import Foundation

class Item: NSObject {

    var name: String = ""
    var valueInDollars: Int = 0
    var serialNumber: String? = ""
    let dateCreated: NSDate = NSDate()
    
    init(name: String, serialNumber: String?, valueInDollars: Int){
        self.name = name
        self.serialNumber = serialNumber
        self.valueInDollars = valueInDollars
        
        super.init()
    }
    
    convenience init(random: Bool){
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = NSUUID().UUIDString
            
            self.init(name: randomName,
                serialNumber: randomSerialNumber,
                valueInDollars: randomValue)
            
        }
        else {
            self.init(name: "Item", serialNumber:"", valueInDollars: 0)
        }
    }
    
    
}
