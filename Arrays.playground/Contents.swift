import UIKit

var str = "Hello, playground. It is Chapter-3"

// MARK:- Empty Arrays
var emptyArrayVol1 = [Int]()
var emptyArrayVol2: [Int] = []
var emptyArrayVol3 = Array<Int>()

// MARK:- Multidimensional Arrays
var multiDArray2x3 = [
    [2,4,4],
    [2,1,3]
]
print(multiDArray2x3)

var multiDArrat3x4x5 = Array(repeating: Array(repeating: Array(repeating: 0,count: 5),count: 4),count: 3)

// MARK:- Extracting values of a given type from an Array with compactMap(_:)
// arrays can contain elements of any type

var anyTypeArray: [Any] = [true, false, 2, 5, 3.3, "String"]
let numbers = anyTypeArray.compactMap { $0 as? Int }
print(numbers)

// use reduce() in order to sum up
let sum = numbers.reduce(0, +)

// MARK:- Transformation of result of an array bt flatMap(_:)
// A 2D array of type [[Int]]
let array2D = [[1, 3], [4], [6, 8, 10], [11]]
// A 1D array of type [Int]
let flattenedArray = array2D.flatMap { $0 }
print(flattenedArray)

// MARK:- Accessing indices safely
extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}

if let thirdValue = anyTypeArray[safe: 2] {
    print(thirdValue)
}

// MARK:- Filtering an Array
let nums = [22, 41, 23, 30]
let evenNumbers = nums.filter { $0 % 2 == 0 }
print(evenNumbers)  // [22, 30]

// MARK:- Transforming the elements of an array with map()
let stringNums = nums.map { String($0) }
print(stringNums)

let multiplyBy2Nums = nums.map { 2 * $0 }
print(multiplyBy2Nums)

// MARK:- Sorting
struct Landmark {
    let name : String
    let metersTall : Int
}
var landmarks = [Landmark(name: "Empire State Building", metersTall: 443),
                 Landmark(name: "Eifell Tower", metersTall: 300),
                 Landmark(name: "The Shard", metersTall: 310)]

landmarks.sort { $0.metersTall < $1.metersTall }

// MARK:- Finding min max elements
struct Vector2 {
    let dx : Double
    let dy : Double
    var magnitude : Double {return sqrt(dx*dx+dy*dy)}
}
let vectors = [Vector2(dx: 3, dy: 2), Vector2(dx: 1, dy: 1), Vector2(dx: 2, dy: 2)]

let lowest = vectors.min { $0.magnitude < $1.magnitude }
let highest = vectors.max { $0.magnitude > $1.magnitude }
