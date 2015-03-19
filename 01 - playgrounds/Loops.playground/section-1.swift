// Playground - noun: a place where people can play

import Cocoa

var int: Int = 0


// for-in loop
for i in 1...5 {
    ++int
    println(int)
    //println("int equals \(int) at iteration \(i)")
}




// for loop (regular)
for var i = 1; i <= 5; ++i {
    ++int
    println(int)
}

// while loop -- same execution
var i = 1
while i < 6{
    ++int
    println(int)
    ++i
}


while shields > 0 {
    println("Fire blasters!")
}

// do-while loop

do {
    println("Fire blasters!")
} while shields > 0



var shields = 5
var blastersOverheating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0

while shields > 0 {
    if spaceDemonsDestroyed == 500 {
        println("You beat the game!")
        break
    }
    
    if blastersOverheating {
        println("Blasters are overheated! Cooldown initiated.")
        sleep(5)
        println("Blasters ready to fire")
        sleep(1)
        blastersOverheating = false
        blasterFireCount = 0
        continue
    }
    if blasterFireCount > 100 {
        blastersOverheating = true
        continue
    }
    
    println("Fire blasters!")
    
    ++blasterFireCount
    ++spaceDemonsDestroyed

}



