//
//  Zombie.swift
//  MonsterTown
//
//  Created by Johanna Lichtman on 2/15/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import Foundation

class Zombie: Monster {

    // part of the factory, do not need to create an instance
    class var spookyNoise: String {
        return "Brains..."
    }
    
    var walksWithLimp: Bool
    private(set) var isFallingApart: Bool
    
    init(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String){
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    
    convenience init(limp: Bool, fallingApart: Bool){
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "")
        if walksWithLimp{
            println("This zombie has a bad knee.")
        }
    }
    
    required init(town: Town?, monsterName: String){
        walksWithLimp = false
        isFallingApart = false
        super.init(town: town, monsterName: monsterName)
    }
    
    final override func terrorizeTown() { 
        //town?.changePopulation(-10)
        if !isFallingApart {
                town?.changePopulation(-10)
        }
        super.terrorizeTown()
    }
    
    deinit {
        println("Zombie named \(name) is no longer with us.")
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
}


