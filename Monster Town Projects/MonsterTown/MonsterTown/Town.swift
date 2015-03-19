//
//  Town.swift
//  MonsterTown
//
//  Created by Johanna Lichtman on 2/14/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import Foundation

struct Town {
    var population = 5422
    var numberOfStopLights = 4

    func printTownDescription(){
            println("Population: \(self.population), number of stop lights: \(self.numberOfStopLights)")
    }
    
    // check if this works
    mutating func changePopulation(amount: Int){
        if population > 0 {
            population += amount
        } else if -amount > population {
            population = 0
        }
    }
}

