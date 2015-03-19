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
    
    // must create instances to get items below
    var walksWithLimp = true

    // get is internal; set is private (other parts of programs hould not be able to set this value
    internal private(set) var isFallingApart = false // can leave off internal as that is the default access control value
    
    final override func terrorizeTown() { 
        //town?.changePopulation(-10)
        if !isFallingApart {
                town?.changePopulation(-10)
        }
        super.terrorizeTown()
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
}


