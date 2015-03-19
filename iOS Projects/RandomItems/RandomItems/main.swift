//
//  main.swift
//  RandomItems
//
//  Created by Johanna Lichtman on 2/16/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import Foundation

var item = Item(random: true)

println("\(item.name) (\(item.serialNumber)) has a value of $\(item.valueInDollars) and was created on \(item.dateCreated).")

let anotherItem = Item(name: "Rusty Spork", serialNumber: nil, valueInDollars: 5)

if let sn = anotherItem.serialNumber {
    println("\(anotherItem.name)'s serial number is \(sn)")
}
else {
    println("\(anotherItem.name) does not have a serial number")
}

// Create an array and store it in the items variable
var items: Array<String> = Array<String>()

// Use the append method on Array to add three strings to the array

items.append("One")
items.append("Two")
items.append("Three")

// Use the insert (_:atIndex:) method to add a string to the beginning of the array
items.insert("Zero", atIndex: 0)

// old school for loop to get info on items
for var i = 0; i < items.count; ++i {
    var item: String = items[i]
    println(item)
}

// the better way in Swift -- 'fast enumeration' -- but can not be used to add or remove items
for item in items{
    println(item)
}