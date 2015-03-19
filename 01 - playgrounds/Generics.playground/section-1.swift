// Playground - noun: a place where people can play

import Cocoa

struct Stack<T> {
    var items = [T]()
    
    mutating func push (newItem: T) {
        items.append(newItem)
    }
    
    mutating func pop() -> T? {
        if items.isEmpty {
            return nil
        } else {
            return items.removeLast()
        }
    }
    
    func map<U>(f: (T) -> (U)) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
}

var stringStack = Stack<String>()
stringStack.push("this is a string")
stringStack.push("anothers string")

println(stringStack.pop())
println(stringStack.pop())
println(stringStack.pop())

var intStack = Stack<Int>() // need to add <Type Name>
intStack.push(1)
intStack.push(2)
var doubledStack = intStack.map({2 * $0})

println(intStack.pop())
println(intStack.pop())
println(intStack.pop())

println(doubledStack.pop())
println(doubledStack.pop())



// takes array of items of type T
// closure that takes argument of type T and returns type U
// return value is array of items of type U
func myMap<T,U>(items: [T], f: (T) -> (U)) -> [U]{
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}

let strings = ["one", "two", "three"]
let stringLengths = myMap(strings, {countElements($0)})
println(stringLengths)



// Type Constraints

func checkIfEqual <T: Equatable> (first: T, second: T) -> Bool {
    return first == second
}

println(checkIfEqual(1,1))
println(checkIfEqual("a string", "a string"))
println(checkIfEqual("a string", "a different string"))

func checkIfDescriptionsMatch <T: Printable, U: Printable> (first: T, second: U) -> Bool {
    return first.description == second.description
}

println(checkIfDescriptionsMatch(Int(1), UInt(1)))
println(checkIfDescriptionsMatch(1, 1.0))
println(checkIfDescriptionsMatch(Float(1.0), Double(1.0)))
