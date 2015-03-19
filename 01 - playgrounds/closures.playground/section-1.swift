// Playground - noun: a place where people can play

import Cocoa

var volunteerCounts = [1,3,40,32,2,53,77,13]

func sortAscending(i: Int, j: Int) -> Bool{
    return i < j
}

let volunteersSorted = sorted(volunteerCounts, sortAscending)


let volunteersSorted2 = sorted(volunteerCounts, {
    (i: Int, j: Int) -> Bool in
    return i < j
})

let volunteersSorted3 = sorted(volunteerCounts, {i, j in i < j})

let volunteersSorted4 = sorted(volunteerCounts, {$0 < $1})

let volunteersSorted5 = sorted(volunteerCounts) {$0 < $1}



// simple make town grand
func makeTownGrand() -> (Int, Int) -> Int {
    func buildRoads (lightsToAdd: Int, toLights: Int) -> Int{
        return toLights + lightsToAdd
    }
    return buildRoads
}

var stopLights = 4
let townPlan = makeTownGrand()
stopLights = townPlan(4, stopLights)
println("Town has \(stopLights) stop lights.")


// add budget to make town grand
func makeTownGrand2(budget: Int, condition: Int -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
        func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
            return toLights + lightsToAdd
        }
        return buildRoads
    } else {
        return nil
    }
}
func evaluateBudget(budget: Int) -> Bool {
    return budget > 10000
}

var stoplights = 4
if let townPlan = makeTownGrand2(1000, evaluateBudget){
    stopLights = townPlan(4, stopLights)
}
println("Town has \(stoplights) stop lights.")


func makeGrowthTracker(forGrowth growth: Int) -> () -> Int {
    var totalGrowth = 0
    func growthTracker() -> Int{
        totalGrowth += growth
        return totalGrowth
    }
    return growthTracker
}
var currentPopulation = 5422
let growBy500 = makeGrowthTracker(forGrowth: 500)

growBy500()
growBy500() // why does this increment?
growBy500()
currentPopulation += growBy500() //
let anotherGrowBy500 = growBy500
anotherGrowBy500()

var someOtherPopulation = 4061981
let growBy10000 = makeGrowthTracker(forGrowth: 10000)
someOtherPopulation += growBy10000()
currentPopulation











