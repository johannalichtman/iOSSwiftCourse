// Playground - noun: a place where people can play

import Cocoa

enum TextAlignment : Int {
    case Left = 20
    case Right = 30
    case Center = 40
    case Justify = 50
}

var alignment = TextAlignment.Left
alignment = .Justify // works for new value

//if alignment == .Right {
//    println("We should right-align the text!")
//}

// create raw value
let myRawValue = 20

// Try to convert the raw value into a TextAlighment [using Optional Binding]

if let myAlignment = TextAlignment(rawValue: myRawValue) {
    println("successfully converted \(myRawValue) to a TextAlignment")
} else {
    println("\(myRawValue) has no corresponding Text Alignment case")
}




println("Left has raw value \(TextAlignment.Left.rawValue)")
println("Right has raw value \(TextAlignment.Right.rawValue)")
println("Center has raw value \(TextAlignment.Center.rawValue)")
println("Justify has raw value \(TextAlignment.Justify.rawValue)")
println("The alignment variable has raw value \(alignment.rawValue)")

switch alignment{
case .Left:
    println("left aligned")

case .Right:
    println("right aligned")
    
case .Center:
    println("center aligned")
    
case .Justify:
    println("justified")
}

enum ProgrammingLanguage : String {
    case Swift      = "Swift"
    case ObjectiveC = "Objective-C"
    case C          = "C"
    case Cpp        = "C++"
    case Java       = "Java"
}

let myFavoriteLanguage = ProgrammingLanguage.Swift
println("My favorite programming language is \(myFavoriteLanguage.rawValue)")


// Enumerations & Methods

enum LightBulb {
    case On
    case Off
    
    // self is lightbulb
    func surfaceTemperatureForAmbientTemperature(ambient: Double) -> Double {
        switch self {
            case .On:
                return ambient + 150.0
            case .Off:
                return ambient
        }
    }
    // must be a mutating method to change self
    mutating func toggle(){
        switch self {
            case .On:
                self = .Off
            case .Off:
                self = .On
        }
    }
}

var bulb = LightBulb.On
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
println("the bulb's temperature is \(bulbTemperature)")

bulb.toggle()
bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
println("the bulb's temperature is \(bulbTemperature)")


// Enumerations & Associated Values

enum ShapeDimensions {
    // Point has no associated value -- it is dimensionless
    case Point
    
    // Square's associated value is the length of one side
    case Square(Double)
    
    // Rectangle's associated value defines its with and height
    case Rectangle(width: Double, height:Double)
    
    // Right Triangle
    case rightTriangle(width: Double, heigth: Double, hypotenuse: Double)
    
    func area() -> Double{
        switch self{
        case let .Point:
            return 0
        case let .Square(side):
            precondition(side >= 0, "side cannot be negative")
            return side * side
        case let .Rectangle(width: w, height: h):
            precondition(w >= 0, "width cannot be negative")
            precondition(h >= 0, "height cannot be negative")
            return w * h
        case let .rightTriangle(width: w, height: h, hypotenuse: t):
            precondition(w >= 0, "width cannot be negative")
            precondition(h >= 0, "height cannot be negative")
            return w * h / 2
        }
    }
}

var squareShape = ShapeDimensions.Square(10.0)
var rectShape = ShapeDimensions.Rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.Point

println("square's area = \(squareShape.area())")
println("rectangle's area = \(rectShape.area())")
println("point's area = \(pointShape.area())")


