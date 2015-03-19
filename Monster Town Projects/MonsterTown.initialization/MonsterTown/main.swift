//
//  main.swift
//  MonsterTown
//
//  Created by Johanna Lichtman on 2/14/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//


// town is a struct
var myTown = Town(population: 10000, stopLights: 6)
myTown.printTownDescription()

let ts = myTown.townSize
println(ts.rawValue)

//myTown.changePopulation(500)
myTown.changePopulation(1000000)
println("Size: \(myTown.townSize.rawValue); population: \(myTown.population)")

var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printTownDescription()
myTown.printTownDescription()

var convenientZombie = Zombie(limp: false, fallingApart: false)

fredTheZombie?.changeName("Fred the Zombie", walksWithLimp: false)

println("Victim pool: \(fredTheZombie?.victimPool)")
fredTheZombie?.victimPool = 500
println("Victim pool: \(fredTheZombie?.victimPool)")

println(Zombie.spookyNoise)
fredTheZombie = nil

