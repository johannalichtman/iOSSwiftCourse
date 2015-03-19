// Playground - noun: a place where people can play

import Cocoa

let playground = "Hello, playground"
var mutablePlayground = "Hello, mutable playground"

mutablePlayground += "!"

for c:Character in mutablePlayground{
    println("\(c)")
}

let oneCoolDude = "\u{1F60E}"

let aAcute = "\u{0061}\u{0301}"

for scalar in playground.unicodeScalars {
    print("\(scalar.value)")
}

let aAcutePrecomposed = "\u{00E1}"

let b = (aAcute == aAcutePrecomposed) //true

println("aAcute: \(countElements(aAcute)); aAcuteDecomposed: \(countElements(aAcutePrecomposed))")