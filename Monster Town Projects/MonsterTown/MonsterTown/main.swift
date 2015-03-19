//
//  main.swift
//  MonsterTown
//
//  Created by Johanna Lichtman on 2/14/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//


// town is a struct
var myTown = Town()
myTown.changePopulation(500)

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()
myTown.printTownDescription()

let z1 = Zombie()
z1.walksWithLimp = false
let z2 = z1
z2.walksWithLimp = true
println("z1 walks with limp? \(z1.walksWithLimp); z2 walks with limp? \(z2.walksWithLimp)")

fredTheZombie.changeName("Fred the Zombie", walksWithLimp: false)

