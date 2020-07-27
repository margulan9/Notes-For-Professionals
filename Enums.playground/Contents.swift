import UIKit

var str = "Hello, playground. It is Chapter-5"

// Simple enums are automatically Hashable, Equatable and have string conversions:

// MARK:- Enums with associated values
enum Action {
    case jump
    case kick
    case move(distance: Float)
}

// The associated values must be provided when instantiating the enum value:
let action = Action.kick
switch action {
case .jump:
    print("jump")
case .kick:
    print("kick")
case .move(let distance):  // or case let .move(distance):
    print("Moving: \(distance)")
}

// single case extraxtion can be done while if case
if case .move(let distance) = action {
    print("Moving: \(distance)")
}

// The guard case syntax can be used for later use extraction
func testGuard() {
    guard case .move(let distance) = action else {
        print("not moving")
        return
    }
}
testGuard()
print()
// MARK:- Raw and Hash values
// Enums without associated values can have raw values

enum Rotation: Int {
    case up = 0
    case left = 90
    case upsideDown = 180
    case right = 270
}

// Integer raw values are assumed to start at 0 and increase monotonically:

// String raw values can be synthesized automatically:
enum MarsMoon: String {
    case phobos  // rawValue is automatically "phobos"
    case deimos  // rawValue is automatically "deimos"
}

// MARK:- Enum Initializers
enum CompassDirection {
    case north(Int)
    case south(Int)
    case east(Int)
    case west(Int)
    
    init?(degrees: Int) {
        switch degrees {
        case 0...45:
            self = .north(degrees)
        case 46...135:
            self = .east(degrees)
        case 136...225:
            self = .south(degrees)
        case 226...315:
            self = .west(degrees)
        case 316...360:
            self = .north(degrees)
        default:
            return nil
        }
    }
    
    var value: Int {
        switch self {
        case .north(let degrees):
            return degrees
        case .south(let degrees):
            return degrees
        case .east(let degrees):
            return degrees
        case .west(let degrees):
            return degrees
            
        }
    }
}

var direction = CompassDirection(degrees: 0) // Returns CompassDirection.north
direction = CompassDirection(degrees: 90) // Returns CompassDirection.east
print(direction?.value ?? 0) //prints 90
direction = CompassDirection(degrees: 500)
print()

// MARK:- Enumerations share many features with classes and structures

protocol ChangesDirection {
    mutating func changeDirection()
}
enum Direction {
    // enumeration cases
    case up, down, left, right
    // initialise the enum instance with a case
    // that's in the opposite direction to another
    init(oppositeTo otherDirection: Direction) {
        self = otherDirection.opposite
    }
    // computed property that returns the opposite direction
    var opposite: Direction {
        switch self {
        case .up:
            return .down
        case .down:
            return .up
        case .left:
            return .right
        case .right:
            return .left
        } }
}
// extension to Direction that adds conformance to the ChangesDirection protocol
extension Direction: ChangesDirection {
    mutating func changeDirection() {
        self = .left }
}
var dir = Direction(oppositeTo: .down) // Direction.up
dir.changeDirection() // Direction.left
let opposite = dir.opposite // Direction.right
