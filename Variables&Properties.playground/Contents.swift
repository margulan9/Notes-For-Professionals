import UIKit

var str = "Hello, playground. It is Chapter-1"

// MARK:- Property Observers

var myProperty = 5 {
    willSet {
        print("Will set to \(newValue). It was previously \(myProperty)")
    }
    didSet {
        print("Did set to \(myProperty). It was previously \(oldValue)")
    }
}
myProperty = 7
print(myProperty)

// parameter names for willSet and didSet also can be declared
var myFontSize = 10 {
    willSet(newFontSize) {
        print("Will set font to \(newFontSize), it was \(myFontSize)")
    }
    didSet(oldFontSize) {
        print("Did set font to \(myFontSize), it was \(oldFontSize)")
    }
}
myFontSize = 12
print(myFontSize)

// MARK:- Lazy Stored Properties
// Lazy stored properties have values that are not calculated until first accessed
func expensiveMethod() -> String{
    return "very expensive"
}

struct ForLazy {
    lazy var veryExpensiveVariable = expensiveMethod()
}

// MARK:- Computed Properties
// Computed properties must define a type

var pi = 3.14
class Circle {
    var radius = 0.0
    var circumference: Double {
        get {
            return pi * radius * 2
        }
        set {
            radius = newValue / pi / 2
        }
    }
}
let circle = Circle()
circle.radius = 1
print(circle.circumference)
circle.circumference = 7
print(circle.radius)

// Read only computed properties
var radius = 2.0
var circumference: Double {
    return pi * radius * 2
}
print(circumference)
