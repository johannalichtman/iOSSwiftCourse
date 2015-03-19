// Playground - noun: a place where people can play

import Cocoa

println("The maximum Int value is \(Int.max).")
println("The minimum Int value is \(Int.min).")
println("The maximum Int value for a 32-bit integer is \(Int32.max).")
println("The minimum Int value for a 32-bit integer is \(Int32.min).")

println("The maximum Int value is \(UInt.max).")
println("The minimum Int value is \(UInt.min).")
println("The maximum Int value for a 32-bit integer is \(UInt32.max).")
println("The minimum Int value for a 32-bit integer is \(UInt32.min).")

let myInt: Int = 10 // declare type explicitly
let myOtherInt = 3 // also of type Int, inferred by the compiler

let myUInt: UInt = 40
let myInt32: Int32 = -1000

// Trouble ahead!
// let myBadInt: UInt = -1
// let myBadInt8: Int8 = 200

println(10 + 20)
println(30 - 5)
println(5 * 6)

println(10 + (2 * 5))
println((30 - 5) - 5)

println(11 / 3) // prints 3
println(11 % 3) // prints 2
println(-11 % 3) // prints -2 (surprise?)

var x = 10
x++
println ("x has been incremented to \(x)")
x--
println ("x has been decremented to \(x)")
x += 10 // equivalent to x = x + 10
println ("x has had 10 added to it and is now \(x)")

let y: Int8 = 120
//let z = y + 10
let z = y &+ 10
println ("120 &+ 10 is \(z)")

let a: Int = 200
let b: Int8 = 50
let c = a + Int(b)
println ("blah \(c)")












