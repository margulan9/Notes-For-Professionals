import UIKit

var str = "Hello, playground. It is Chapter-2"
// rounding

round(3.000) // 3
round(3.001) // 3
round(3.499) // 3
round(3.500) // 4
round(3.999) // 4
round(-3.000) // -3
round(-3.001) // -3
round(-3.499) // -3
round(-3.500) // -4  *** careful here ***
round(-3.999) // -4

// ceiling
ceil(3.000) // 3
ceil(3.001) // 4
ceil(3.999) // 4
ceil(-3.000) // -3
ceil(-3.001) // -3
ceil(-3.999) // -3

// flooring

floor(3.000) // 3
floor(3.001) // 3
floor(3.999) // 3
floor(-3.000) // -3
floor(-3.001) // -4
floor(-3.999) // -4

// MARK:- Random number generator
let flip = arc4random_uniform(2) // prints 0 or 1

// general form
//let number = min + arc4random_uniform(max - min + 1)

// MARK:- Exponentiation
let number = pow(5.0, 2.0) // Equals 25
