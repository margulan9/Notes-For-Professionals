import UIKit

var str = "Hello, playground. It is Chapter-6"

// An error indicates a non-fatal failure during program execution, and is handled with the specialized control-flow constructs do-cathch, throw, and try.
// Any value which conforms to ErrorType protocol can be thrown as an error

//enum NetworkError: Error {
//    // Swift 3 dictates that enum cases should be `lowerCamelCase`
//    case offline
//    case serverError(String)
//}
//
//func fetchResource(resource: NSURL) throws -> String {
//    if let (statusCode, responseString) = /* ...from elsewhere...*/ {
//        if case 500..<600 = statusCode {
//            throw NetworkError.serverError(responseString)
//        } else {
//            return responseString
//        }
//    } else {
//        throw NetworkError.offline
//    }
//}

// MARK:- Catching different Error types
enum CustomError: Error {
    case someError
    case anotherError
}
func throwing() throws {
    throw CustomError.someError
}

do {
    try throwing()
} catch {
    print(error)
}

// MARK:- Catch and Switch Pattern for Explicit Error Handling
class Plane {
    enum Emergency: Error{
        case noFuel
        case engineFailure(reason: String)
        case damgedWing
    }
    var fuelInKilograms: Int?
    
    func fly() throws {
        // ...
        if fuelInKilograms ?? 0 <= 0 {
            // uh oh...
            throw Emergency.noFuel
        }
    }
}

let airforceOne = Plane()
do {
    try airforceOne.fly()
} catch let emergency as Plane.Emergency {
    switch emergency {
    case .noFuel:
        // call nearest airport for emergency landing
        print("noFuel")
    case .engineFailure(let reason):
        print(reason) // let the mechanic know the reason
    case .damgedWing:
        // Assess the damage and determine if the president can make it
        print("damagedWinf")
    }
}

// MARK:- Create a custom error with localized description

enum RegistrationError: Error {
    case invalidEmail
    case invalidPassword
    case invalidPhoneNumber
}

extension RegistrationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return NSLocalizedString("Description", comment: "Invalid Email")
        case .invalidPassword:
            return NSLocalizedString("Description", comment: "Invalid Password")
        case .invalidPhoneNumber:
            return NSLocalizedString("Description", comment: "Invalid Phone Number")
        }
    }
}
let error = RegistrationError.invalidPassword
print(error.errorDescription)
