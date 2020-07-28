import UIKit

var str = "Hello, playground. It is Chapter-7"

// MARK:- Protocol Basics
/*
 Protocol defines blueprint of some action which can be conformed by class struct or enum
 */

protocol MyProtocol {
    init(value: Int)
    func doSomething() -> Bool
    var message: String { get }
    var value: Int { get set }
    subscript(index: Int) -> Int { get }
    static func instructions() -> String   // This protocol define all possible properties, methods and inits which can be defined in it.
    static var max: Int { get }
    static var total: Int { get set }
}
// It can be conformed by class struct or enum
struct MyStruct : MyProtocol {
    init(value: Int) {
        self.value = value
        self.message = "Hello"
        self.value = 5
    }
    
    var message: String
    var value: Int
    
    subscript(index: Int) -> Int {
        return 5
    }
    
    static func instructions() -> String {
        return "instructions"
    }
    
    static var max: Int = 5
    static var total: Int = 5
}
class MyClass : MyProtocol {
    var message: String
    
    var value: Int
    
    required init(value: Int) {
        self.value = value
        self.message = "Hello"
        self.value = 5
    }
    
    subscript(index: Int) -> Int {
        return 5
    }
    
    static func instructions() -> String {
        return "instructions"
    }
    
    static var max: Int = 10
    static var total: Int = 10
}

// Or it can define default implementation by extension:
extension MyProtocol {
    func doSomething() -> Bool {
        print("Do something")
        return false == true
    }
}

// Protocol can be used as Type:
let items : [MyProtocol] = [MyStruct(value: 0), MyClass(value: 0)]
func doStuff(object: MyProtocol) {
    print(object.doSomething())
    print(object.message)
}
doStuff(object: items[0])

// MARK:- Delegate Pattern
// Protocol delefate pattern is when one class delegates responsiblity for implementing some functionality to another

protocol ChildDelegate: class {
    func childDidSomething()
}

class ChildClass {
    weak var delegate: ChildDelegate?
    
    func performDelegate() {
        delegate?.childDidSomething()
    }
}

class ParentClass: ChildDelegate {
    let child = ChildClass()
    
    func delegateLauncher() {
        self.child.delegate = self
    }
    func childDidSomething() {
        print("Do Child Actions")
    }
}

