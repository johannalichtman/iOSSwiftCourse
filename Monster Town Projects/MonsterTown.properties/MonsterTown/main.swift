//
//  main.swift
//  MonsterTown
//
//  Created by Johanna Lichtman on 2/14/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//


// town is a struct
var myTown = Town()

let ts = myTown.townSize
println(ts.rawValue)

//myTown.changePopulation(500)
myTown.changePopulation(1000000)
println("Size: \(myTown.townSize.rawValue); population: \(myTown.population)")

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

println("Victim pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
println("Victim pool: \(fredTheZombie.victimPool)")

println(Zombie.spookyNoise)

