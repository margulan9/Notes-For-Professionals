import UIKit
import SwiftyJSON

var str = "Hello, playground. It is Chapter-8"

// MARK:- JSON Serialization, Encode / Decode with Apple Foundation and Swift Standard Library

// Read JSON
do {
    guard let jsonData = "[\"Hello\", \"JSON\"]".data(using: String.Encoding.utf8) else {
        fatalError("couldn't encode string as UTF-8")
    }
    // Convert JSON from NSData to AnyObject
    let jsonObjet = try JSONSerialization.jsonObject(with: jsonData, options: [])
    
    // Try to convert AnyObject to array of strings
    if let stringArray = jsonObjet as? [String] {
        print("Got array of strings: \(stringArray.joined(separator: ", "))")
        print(stringArray)
    }
} catch {
    print("error reading JSON: \(error)")
}
print()

guard let jsonDataForSerialization = "[\"Hello\", \"JSON\"]".data(using: String.Encoding.utf8) else {
    fatalError("couldn't encode string as UTF-8")
}
let jsonObject = try JSONSerialization.jsonObject(with: jsonDataForSerialization, options: [])

// Write JSON
do {
    // Convert object to JSON as NSData
    let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [])
    
    // Convert NSData to String
    let jsonString = String(data: jsonData, encoding: .utf8)!
    print("JSON string: \(jsonString)")
} catch {
    print("error writing JSON: \(error)")
}

// Codable
struct Book: Codable {
    let title: String
    let authors: [String]
    let publicationDate: Date
}

// Encode to JSON data

//let encoder = JSONEncoder()
//let data = try! encoder.encode(book) // Do not use try! in production code
//print(data)

// Decode data from JSON

//let jsonData = jsonString.data(using: .utf8)!
//let decoder = JSONDecoder()
//let book = try! decoder.decode(Book.self, from: jsonData)
//print(book)

// Sometimes argument names in json and in model are not the same
// For that reason we have to use CodingKey protocol in order to satisfy conditions

struct CopyBook: Codable {
    let name: String
    let authors: [String]
    let publicationDate: Date
    
    init(name: String, authors: [String], publicationDate: Date) {
        self.name = name
        self.authors = authors
        self.publicationDate = publicationDate
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case authors
        case publicationDate = "publication_date"
    }
}

// MARK:- SwiftyJSON

/// Create JSON Object
//let jsonObject = JSON(jsonObject)

/// To access your data, use subscripts:
//let firstObjectInAnArray = jsonObject[0]
//let nameOfFirstObject = jsonObject[0]["name"]

/// You can then parse your value to a certain data type, which will return an optional value:
//let nameOfFirstObject = jsonObject[0]["name"].string //This will return the name as a string
//let nameOfFirstObject = jsonObject[0]["name"].double //This will return null
