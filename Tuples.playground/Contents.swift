import UIKit

var str = "Hello, playground. It is Chapter-4"

// MARK:- What are Tuples
// A tuple type is a comma-separated list of types, enclosed in parentheses.

let tuple = ("one", 2, "three")
print(tuple.0)

let namedTuple = (first: "one", middle: 2,  last: "three")
print(namedTuple.last)
print()

// MARK:- Decomposing into individual variables
let myTuple = (age: 20, name: "Margulan")
let (first, second) = myTuple
print(first)
print(second)
print()

// MARK:- Tuples as the Return Value of Functions
func returnTuple() -> (Int, String) {
    return (5, "five")
}
print(returnTuple())
print()

// MARK:- Using typealias with tuples
// without typealias
let unitCircle: (center: (x: CGFloat, y: CGFloat), radius: CGFloat) = ((0.0, 0.0), 1.0)
func doubleRadius(ofCircle circle: (center: (x: CGFloat, y: CGFloat), radius: CGFloat)) -> (center: (x: CGFloat, y: CGFloat), radius: CGFloat) {
    return (circle.center, circle.radius * 2.0)
}

// with typealias
typealias CircleAlias = (center: (x: CGFloat, y: CGFloat), radius: CGFloat)

let unitCircle2: CircleAlias = ((0.0, 0.0), 1.0)
func doubleRadius2(ofCicrle circle: CircleAlias) -> CircleAlias {
    return (circle.center, circle.radius * 2.0)
}
print()

// MARK:- Tuples as Case in Switch
let switchTuple = (firstCase: true, secondCase: false)
switch switchTuple {
 case (true, false):
    print(switchTuple)
 case (true, true):
    print(switchTuple)
 case (false, true):
    print(switchTuple)
 case (false, false):
    print(switchTuple)
}

// common use for Tuples as Case in Switch is in Size Classes
//let switchTuple = (UIUserInterfaceSizeClass.Compact, UIUserInterfaceSizeClass.Regular)
//switch switchTuple {
//case (.Regular, .Compact):
////statement
//case (.Regular, .Regular):
//    //statement
//case (.Compact, .Regular):
//    //statement
//case (.Compact, .Compact):
//    //statement
//}


