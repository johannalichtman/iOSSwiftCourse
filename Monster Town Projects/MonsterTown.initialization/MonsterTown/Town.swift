//
//  Town.swift
//  MonsterTown
//
//  Created by Johanna Lichtman on 2/14/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import Foundation

struct Town {
    let region: String

    var population: Int {
        didSet(oldPopulation){
            println("The population has changed to \(population) from \(oldPopulation)")
        }
    }
    var numberOfStopLights: Int
    
    init(region: String, population: Int, stopLights: Int){
        self.region = region // syntax when parameter and initializer name are the same
        self.population = population
        numberOfStopLights = stopLights // syntax when parameter != initializer name
    }
    
    init(population: Int, stopLights: Int){
        self.init(region: "N/A", population: population, stopLights: stopLights)
    }

    enum Size: String {
        case Small = "Small"
        case Medium = "Medium"
        case Large = "Large"
    }
    
    var townSize: Size {
        get {
            precondition(self.population >= 0, "Town cannot have negative population.")
            switch self.population {
            case 0...10000:
                return Size.Small
                
            case 10001...100000:
                return Size.Medium
                
            default:
                return Size.Large
            }
        }
    }
    
    func printTownDescription(){
            println("Population: \(self.population), number of stop lights: \(self.numberOfStopLights)")
    }
    
    // check if this works
    mutating func changePopulation(amount: Int){
        precondition(self.population >= 0, "Town cannot have negative population.")
        if population > 0 {
            population += amount
        }
    }
}

