// Playground - noun: a place where people can play

import Cocoa

var errorCodeString: String?
//errorCodeString = "404"

if let theError = errorCodeString {
    println(theError)
}

var errorCodeInt: Int?
errorCodeInt = errorCodeString?.toInt()?.advancedBy(100)

if errorCodeString != nil {
    let theError = errorCodeString!
    println(theError)
}

if let theError = errorCodeString {
    println(theError)
}

if let errInt = errorCodeInt {
    println("The integer error code is \(errInt).")
} else {
    println("errorCodeSTring was either nil or could not be converted to integer.")
}

var actualErrorCode: Int
if let errInt = errorCodeString?.toInt() {
    actualErrorCode = errInt
} else {
    actualErrorCode = 500
}

println("actualErrorCode = \(actualErrorCode)")





