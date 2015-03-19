//
//  Monster.swift
//  MonsterTown
//
//  Created by Johanna Lichtman on 2/15/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import Foundation

class Monster {
    var town: Town? = nil
    var name: String
    
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set (newVictimPool) {
                town?.population = newVictimPool
            }
    }
    
    // requires sublcass to provide a specific initializer
    required init(town: Town?, monsterName: String){
        self.town = town
        name = monsterName
    }
    
    // optional binding
    func terrorizeTown() {
        if let t = town {
            println("\(name) is terrorizing a town!")
        } else {
            println("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
