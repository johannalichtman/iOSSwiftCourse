// Playground - noun: a place where people can play

import Cocoa

func printGreeting() {
    println("Hello, playground.")
}
printGreeting()

func printPersonalGreeting(name: String){
    println("Hello \(name), welcome to your playground.")
}
printPersonalGreeting("Matt")

func printPersonalGreetings(names: String...){
    for name in names {
    println("Hello \(name), welcome to your playground.")
    }
}
printPersonalGreetings("Aaron","Brian","John","Matt")

func divisionDescription(num: Double, den: Double) {
    println("\(num) divided by \(den) equals \(num / den)")
}
divisionDescription(9,3)


// with parameters defined
func divisionDescriptionWParam(numerator num: Double, denominator den: Double) {
    println("\(num) divided by \(den) equals \(num / den)")
}
divisionDescriptionWParam(numerator: 9,denominator: 3)


// with parameters = internal name
func divisionDescription3(#numerator: Double, #denominator: Double) {
    println("\(numerator) divided by \(denominator) equals \(numerator / denominator)")
}
divisionDescription3(numerator: 9,denominator: 3)


// with default values
func divisionDescription4(#numerator: Double, #denominator: Double, punctuation: String = "."){
    println("\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)")
}
divisionDescription4(numerator: 9,denominator: 3)
divisionDescription4(numerator: 9,denominator: 3, punctuation: "!")

// with default values + return
func divisionDescription5(#numerator: Double, #denominator: Double, punctuation: String = ".") -> String {
    return("\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)")
}
println(divisionDescription5(numerator: 9,denominator: 3))
println(divisionDescription5(numerator: 9,denominator: 3, punctuation: "!"))

func areaOfTriangle(base: Double, height: Double) -> Double{
    let numerator = base * height
    func divide() -> Double {
        return numerator / 2
    }
    return divide()
}
areaOfTriangle(3, 5)

func sortEvenOdd(numbers: [Int]) -> (evens: [Int], odds: [Int]){
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens,odds)
}

let aBunchOfNumbers = [10,1,4,3,57,43,84,27,256,111]
let theSortedNumbers = sortEvenOdd(aBunchOfNumbers)
println("The even numbers are: \(theSortedNumbers.evens); the odd numbers are: \(theSortedNumbers.odds)")


func grabMiddleName(name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(("Matt","Michael","Mathias"))

// need the binding b/c variable is string optional
if let theName = middleName {
    println(theName)
}




