// Playground - noun: a place where people can play

import Cocoa

//old school way of declaring?
//var bucketList: Array<String>

//string is explicitly declared
var bucketList: [String] = ["Climb Mt. Everest"] // need the = [] to initialize

//shortcut where string is implicitly declared
//var bucketList = ["Climb Mt. Everest"]

//bucketList.append("Fly hot air balloon to Fiji")
//bucketList.append("Watch the Lord of the Rings trilogy in one day")
//bucketList.append("Go on a walkabout")
//bucketList.append("Scuba dive in the Great Blue Hole")
//bucketList.append("Find a triple rainbow")

var newItems = [
            "Fly hot air balloon to Fiji",
            "Watch the Lord of the Rings trilogy in one day",
            "Go on a walkabout",
            "Scuba dive in the Great Blue Hole",
            "Find a triple rainbow"
]

//Option #1
//for item in newItems{
//    bucketList.append(item)
//}

//Option #2
//bucketList.extend(newItems)

//Option #3
bucketList += newItems
bucketList

bucketList.removeAtIndex(2)
println(bucketList.count)
println(bucketList[0...2])
bucketList[2] += " in Australia"
bucketList[0] = "Climb Mt. Kilimanjaro"
bucketList.insert("Toboggan across Alaska", atIndex: 2) // This overwrites?
bucketList

var myronsList = [
    "Climb Mt. Kilimajaro",
    "Fly hot air balloon to Fiji",
    "Toboggan across Alaska",
    "Go on a walkabout in Australia",
    "Scuba dive in the Great Blue Hole",
    "Find a triple rainbow"
]

let equal = (bucketList == myronsList)

let lunches = [
    "Cheeseburger",
    "Veggie Pizza",
    "Chicken Caesar Salad",
    "Black Bean Burrito",
    "Felafel wrap"
]
