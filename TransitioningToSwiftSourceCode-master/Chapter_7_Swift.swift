//  Source Code for Transitioning to Swift, Chapter 7
//
//  http://www.apress.com/9781484204078
//
//  Author: Scott Gardner
//  Publisher: Apress
//  ISBN-10: 1484204077
//  ISBN-13: 978-1484204078
//
//  Copyright (c) 2014 Scott Gardner. All rights reserved.
//
//  Developed by: Scott Gardner
//  Apress Media LLC
//  http://www.apress.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal with the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//  * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimers.
//  * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimers in the documentation and/or other materials provided with the distribution.
//  * Neither the names of Scott Gardner, Apress Media LLC, nor the names of its contributors may be used to endorse or promote products derived from this Software without specific prior written permission.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.

// ******************** BEGIN Table 7-6

// In .swift file
class MyCustomClass {
  class var defaultTitle: String {
    return "A Worthy Title"
  }
  var title: String!
  init(title: String) {
    self.title = title
  }
  convenience init() {
    self.init(title: MyCustomClass.defaultTitle)
  }
}
let myCustomClass1 = MyCustomClass() // myCustomClass1.title = "A Worthy Title"
let myCustomClass2 = MyCustomClass(title: "A Great Title") // myCustomClass2.title = "A Great Title"

// ******************** END Table 7-6

// ******************** BEGIN Table 7-7

struct MyStruct {
  static let date = "9/9/14"
  var message = "Hello iPhone"
  var value = 6
  init() {}
  init(message: String, value: Int) {
  self.message = message
  self.value = value
  }
}
let myStruct1 = MyStruct()
var myStruct2 = MyStruct(message: "goodbye iPhone", value: 5)
println("\(MyStruct.date): \(myStruct1.message) \(myStruct1.value), \(myStruct2.message) \(myStruct2.value)") // Prints "9/9/14: Hello iPhone 6, goodbye iPhone 5"

// ******************** END Table 7-7

// ******************** BEGIN Table 7-8

enum MyEnum1 {
  case value1, value2, value3
}
var myEnum1 = MyEnum1.value1
println(_stdlib_getDemangledTypeName(myEnum1)) // Prints "...MyEnum1"
myEnum1 = .value2
println(_stdlib_getDemangledTypeName(myEnum1)) // Prints "...MyEnum1"
enum MyEnum2: Int {
  case value1 = 1, value2, value3
  init() {
  self = value3
  }
}
var myEnum2 = MyEnum2()
println(myEnum2.rawValue) // Prints "3"
myEnum2 = .value1
println(myEnum2.rawValue) // Prints "1"

// ******************** END Table 7-8

// ******************** BEGIN Table 7-9

class Person {
  let firstName: String!
  let lastName: String!
  init?(firstName: String, lastName: String) {
    if firstName.isEmpty || lastName.isEmpty {
      return nil
    }
    self.firstName = firstName
    self.lastName = lastName
  }
}
let noOne = Person(firstName: "", lastName: "")
println(noOne) // Prints "nil"
let vivian = Person(firstName: "Vivian", lastName: "Gardner")
println("\(vivian!.firstName) \(vivian!.lastName)") // Prints "Vivian Gardner"
struct Polygon {
  let sides: Int!
  init!() {
    sides = 5
  }
  init?(sides: Int) {
    if sides < 3 { return nil }
    self.sides = sides
  }
}
let pentagon = Polygon()
println(pentagon.sides) // Prints "5"
let hectogon = Polygon(sides: 100)
if let sides = hectogon?.sides {
  println(sides)
}
// Prints "100"
import Foundation
enum AirPressure: String {
  case Hectopascals = "inHg"
  case Millibars = "mb"
  var value: Double! {
    // API call that gets current air pressure in hectopascals, e.g., 30 inHg
    let currentAirPressure = 30.0
    switch self {
    case .Hectopascals:
      return currentAirPressure
    case .Millibars:
      return currentAirPressure * 33.8637526
    }
  }
  var reading: String {
    let roundedValue = String(format: "%.1f", value)
    return "\(roundedValue) \(self.rawValue)"
  }
  init?(_ unit: String) {
    if unit.isEmpty { return nil }
    if let airPressure = AirPressure(rawValue: unit) {
    self = airPressure
  } else {
    return nil
    }
  }
}
var airPressure = AirPressure("mb")
println(airPressure!.reading) // Prints "1015.9 mb"
airPressure = .Hectopascals
println(airPressure!.reading) // Prints "30.0 inHg"

// ******************** END Table 7-9

// ******************** BEGIN Table 7-11

var title: String!
struct HttpStatusChecker {
  var code: Int!
  var message: String!
  var status: (Int, String) {
    get {
      return (code, message)
    }
    set {
    code = newValue.0
    message = newValue.1
    }
  }
  init(status: (Int, String)) {
  code = status.0
  message = status.1
  }
}
var httpStatusChecker = HttpStatusChecker(status: (200, "OK"))
println("code: \(httpStatusChecker.status.0), status: \(httpStatusChecker.status.1)") // Prints "code: 200, status: OK"
// In structure or enumeration
struct SomeStruct {
  static var defaultTitle = "A Worthy Title"
  class DateChecker {
    class var dateString: String {
    return NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .ShortStyle, timeStyle: .NoStyle)
    }
  }
}
println(SomeStruct.DateChecker.dateString) // Prints current date, e.g., "9/14/14"
class TitleTracker {
  var title: String! {
    willSet {
      print("'\(newValue)' (fka '\(title)'). ")
    }
    didSet {
      println("Farewell to '\(oldValue).'")
    }
  }
  init(title: String) {
    self.title = title
  }
}
let myTitleTracker = TitleTracker(title: "A Worthy Title")
myTitleTracker.title = "A Better Title" // Prints "'A Better Title' (fka 'A Worthy Title'). Farewell to 'A Worthy Title.'"

// ******************** END Table 7-11

enum BookID {
  case isbn10(Int)
  case isbn13(String)
  case oclc(String)
  case lccn(String)
  case olid(String)
  var title: String! {
  var t: String!
  switch self {
  // Simulating setting t via API call or query
  case let .isbn10(id):
    t = "Transitioning to Swift"
  case let .isbn13(id):
    t = "Transitioning to Swift"
  case let .oclc(id):
    t = "Transitioning to Swift"
  case let .lccn(id):
    t = "Transitioning to Swift"
  case let .olid(id):
    t = "Transitioning to Swift"
  }
  return t
  }
}
let bookId = BookID.isbn10(1484204077)
println(bookId.title) // Prints "Transitioning to Swift"

class Introspector {
  var values: Any!
  subscript(theValues: Int...) -> (sum: Int, average: Double) {
    values = theValues
    var sum = 0
    for integer in theValues {
      sum += integer
  }
  let average = Double(sum) / Double(theValues.count)
  return (sum: sum, average: average)
  }
  subscript(theValues: Double...) -> (sum: Double, average: Double) {
    values = theValues
    var sum = 0.0
    for value in theValues {
      sum += Double(value)
  }
  let average = sum / Double(theValues.count)
  return (sum: sum, average: average)
  }
}
let myIntrospector = Introspector()
let result1 = myIntrospector[1, 2, 3, 4, 5]
println("For \(myIntrospector.values), sum is \(result1.sum) and average is \(result1.average).") // Prints "For [1, 2, 3, 4, 5], sum is 15 and average is 3.0."
let result2 = myIntrospector[1.1, 2.2, 3.3, 4.4, 5.5]
println("For \(myIntrospector.values), sum is \(result2.sum) and average is \(result2.average).") // Prints "For [1.1, 2.2, 3.3, 4.4, 5.5], sum is 16.5 and average is 3.3."

struct Incrementor {
  static var value = 0
  static func increment(_ increment: Int = 1) {
    value++
    println(value)
  }
  init() {
    printCurrentValue()
  }
  func printCurrentValue() {
    println("Current value: \(Incrementor.value)")
  }
  func topLevelFunc() {
    func nestedFunc() {
      printCurrentValue()
    }
    nestedFunc()
  }
}
Incrementor.increment() // Prints "1"
Incrementor.increment() // Prints "2"
var typer = Incrementor() // Prints "Current value: 2"
typer.topLevelFunc() // Prints "Current value: 2"

// ******************** BEGIN Table 7-12

class SalutationPrinter {
  class func print(salutation: String, toRecipient recipient: String) {
    println("\(salutation) \(recipient)")
  }
  func print(salutation: String, toRecipient recipient: String) {
    println("\(salutation) \(recipient)")
  }
}
struct Counter {
  var total = 0
  var reset: Bool = false
  mutating func increment() {
    if reset {
      self = Counter()
    }
    total++
    println(total)
  }
}
let salutationPrinter = SalutationPrinter()
salutationPrinter.print("Hello", toRecipient: "Henry") // Prints "Hello Henry"
SalutationPrinter.print("Hello", toRecipient: "Henry") // Prints "Hello Henry"
var counter = Counter()
counter.increment() // Prints "1"
counter.increment() // Prints "2"
counter.reset = true
counter.increment() // Prints "1"

// ******************** END Table 7-12

// In SwiftClass.swift
@objc class MySwiftCustomClass: NSObject {
    var enabled: Bool
    init(enabled: Bool) {
    self.enabled = enabled
    super.init()
    }
}

// ******************** BEGIN Table 7-13

class KeyboardDisplayHandler {
  init() {
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow", name: UIKeyboardWillShowNotification, object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide", name: UIKeyboardWillHideNotification, object: nil)
  }
  func keyboardWillShow() {
    // ...
  }
  func keyboardWillHide() {
    // ...
  }
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
}

// ******************** END Table 7-13

// ******************** BEGIN Table 7-14

class Employee {
  weak var parkingSpaceAssignment: ParkingSpaceAssignment?
  init() { }
  deinit {
  parkingSpaceAssignment = nil
  println("Fired!")
  }
}
class ParkingSpace {
  let number: Int
  weak var assignment: ParkingSpaceAssignment?
  init(number: Int) {
  self.number = number
  }
}
class ParkingSpaceAssignment {
  unowned var parkingSpace: ParkingSpace
  unowned var employee: Employee
  init(parkingSpace: ParkingSpace, employee: Employee) {
  self.parkingSpace = parkingSpace
  self.employee = employee
  }
  deinit {
  println("Assignment deleted")
  }
}
var chris: Employee? = Employee()
var parkingSpace = ParkingSpace(number: 8)
chris!.parkingSpaceAssignment = ParkingSpaceAssignment(parkingSpace: parkingSpace, employee: chris!)
chris = nil
/* Prints:
Assignment deleted
Fired!
*/

// ******************** END Table 7-14

// ******************** BEGIN Table 7-15

class Bravo {
  var value: String
  init(_ value: String) {
    self.value = value
  }
  deinit {
    println("Bravo deallocated")
  }
}
class Charlie {
  var value: String
  init(_ value: String) {
    self.value = value
  }
  deinit {
    println("Charlie deallocated")
  }
}
class Alpha {
  var value: String
  var bravo: Bravo?
  var charlie: Charlie?
  lazy var printOutValues: () -> () = {
    [unowned self, weak bravo = self.bravo, weak charlie = self.charlie] in
    if bravo != nil && charlie != nil {
      println("\(self.value) \(bravo!.value) \(charlie!.value)")
    }
  }
  init(value: String, bravoValue: String, charlieValue: String) {
    self.value = value
    bravo = Bravo(bravoValue)
    charlie = Charlie(charlieValue)
  }
  deinit {
    println("Alpha deallocated")
  }
}
var alpha: Alpha? = Alpha(value: "Alpha", bravoValue: "Bravo", charlieValue: "Charlie")
alpha?.printOutValues() // Prints "Alpha Bravo Charlie"
alpha!.bravo = nil // Prints "Bravo deallocated"
alpha!.charlie = nil // Prints "Charlie deallocated"
alpha = nil // Prints "Alpha deallocated"

// ******************** END Table 7-15

// ******************** BEGIN Table 7-16

class StoreManager {
  class var sharedManager: StoreManager {
    struct Manager {
      static let instance = StoreManager()
    }
    return Manager.instance
  }
}
let sharedStoreManager1 = StoreManager.sharedManager
let sharedStoreManager2 = StoreManager.sharedManager
println(sharedStoreManager1 === sharedStoreManager2) // Prints "true"

// ******************** END Table 7-16
