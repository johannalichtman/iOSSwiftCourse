//
//  Monster.swift
//  MonsterTown
//
//  Created by Johanna Lichtman on 2/15/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import Foundation

class Monster {
    var town: Town? = Town()
      var name = "Monster"
    
    // optional binding
    func terrorizeTown() {
        if let t = town {
            println("\(name) is terrorizing a town!")
        } else {
            println("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
