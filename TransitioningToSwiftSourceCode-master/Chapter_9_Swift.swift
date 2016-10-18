//  Source Code for Transitioning to Swift, Chapter 9
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

// ******************** BEGIN Table 9-1

import Foundation
class Value {
  var integerProperty = 0
  var doubleProperty = 0.0
  var changingCaseStringProperty = ""
  var stringProperty: String {
    get {
      return changingCaseStringProperty
    }
    set {
      changingCaseStringProperty = newValue.lowercaseString
    }
  }
  var description: String {
    return "Values: \(integerProperty), \(doubleProperty), \(stringProperty)"
  }
  final var valueArray: ValueArray {
    let valueArray = ValueArray(integer: integerProperty, double: doubleProperty, string: stringProperty)
    return valueArray
  }
  required init(integer: Int, double: Double, string: String) {
    integerProperty = integer
    doubleProperty = double
    stringProperty = string
  }
  func printDescription() {
    println(description)
  }
  deinit {
    println("Value deallocated")
  }
}
class ValueArray: Value {
  override var stringProperty: String {
    get {
      return super.changingCaseStringProperty
    }
    set {
      super.changingCaseStringProperty = newValue.uppercaseString
    }
  }
  var integerArray: [Int]!
  var doubleArray: [Double]!
  var stringArray: [String]!
  var count: Int
  override var description: String {
    return "Value arrays (\(count) per array):\n\(integerArray)\n\(doubleArray)\n\(stringArray)"
  }
  init(integer: Int, double: Double, string: String, count: Int) {
    self.count = count
    integerArray = [Int](count: count, repeatedValue: integer)
    doubleArray = [Double](count: count, repeatedValue: double)
    super.init(integer: integer, double: double, string: string)
    stringArray = [String](count: count, repeatedValue: stringProperty)
    printDescription()
  }
  required convenience init(integer: Int, double: Double, string: String) {
    self.init(integer: integer, double: double, string: string, count: 3)
  }
  override func printDescription() {
    println(super.description)
    println(description)
  }
  deinit {
    println("ValueArray deallocated")
  }
}
let value = Value(integer: 1, double: 2.3, string: "CHARLIE")
value.printDescription() // Prints "Values: 1, 2.3, charlie"
var valueArray1: ValueArray? = value.valueArray
/* Prints:
Values: 1, 2.3, CHARLIE
Value arrays (3 per array):
[1, 1, 1]
[2.3, 2.3, 2.3]
[CHARLIE, CHARLIE, CHARLIE]
*/
let valueArray2 = ValueArray(integer: 1, double: 2.3, string: "delta")
/* Prints:
Values: 1, 2.3, DELTA
Value arrays (3 per array):
[1, 1, 1]
[2.3, 2.3, 2.3]
[DELTA, DELTA, DELTA]
*/
let valueArray3 = ValueArray(integer: 8, double: 7.6, string: "echo", count: 4)
/* Prints:
Values: 8, 7.6, ECHO
Value arrays (4 per array):
[8, 8, 8, 8]
[7.6, 7.6, 7.6, 7.6]
[ECHO, ECHO, ECHO, ECHO]
*/
valueArray1 = nil
/* Prints:
ValueArray deallocated
Value deallocated
...
*/

// ******************** END Table 9-1

// ******************** BEGIN Table 9-3

let randomPrimeGenerator = {
  () -> Int in
  start: while true {
    var randomInteger = arc4random_uniform(11)
    randomInteger = randomInteger > 1 ? randomInteger : 2
    for i in 2...randomInteger {
      if randomInteger != i {
        if randomInteger % i == 0 {
          continue start
        }
      }
    }
    return Int(randomInteger)
  }
}
func ==(lhs: Value, rhs: Value) -> Bool {
  return lhs.integerProperty == rhs.integerProperty && lhs.doubleProperty == rhs.doubleProperty && lhs.stringProperty == rhs.stringProperty
}
extension Value: Equatable {
  var primeIntegerProperty: Int {
    return randomPrimeGenerator()
  }
  final var primeValueArray: ValueArray {
    let primeInteger = primeIntegerProperty
    let spellOutFormatter = NSNumberFormatter()
    spellOutFormatter.numberStyle = .SpellOutStyle
    let string = spellOutFormatter.stringFromNumber(primeInteger)!
    let valueArray = ValueArray(integer: primeInteger, double: Double(primeInteger), string: string, count: primeInteger)
    return valueArray
  }
}
let value1 = Value(integer: 1, double: 1.0, string: "One")
let valueArray4 = value1.primeValueArray
/* Prints (for example):
Values: 5, 5.0, FIVE
Value arrays (5 per array):
[5, 5, 5, 5, 5]
[5.0, 5.0, 5.0, 5.0, 5.0]
[FIVE, FIVE, FIVE, FIVE, FIVE]
*/
let value2 = Value(integer: 2, double: 2.0, string: "Two")
while value1.primeValueArray != value2.primeValueArray {
  println("No match yet...")
}
/* Prints (for example):
Values: 3, 3.0, THREE
Value arrays (3 per array):
[3, 3, 3]
[3.0, 3.0, 3.0]
[THREE, THREE, THREE]
Values: 5, 5.0, FIVE
Value arrays (5 per array):
[5, 5, 5, 5, 5]
[5.0, 5.0, 5.0, 5.0, 5.0]
No match yet...
[FIVE, FIVE, FIVE, FIVE, FIVE]
Values: 5, 5.0, FIVE
Value arrays (5 per array):
[5, 5, 5, 5, 5]
[5.0, 5.0, 5.0, 5.0, 5.0]
[FIVE, FIVE, FIVE, FIVE, FIVE]
Values: 5, 5.0, FIVE
Value arrays (5 per array):
[5, 5, 5, 5, 5]
[5.0, 5.0, 5.0, 5.0, 5.0]
[FIVE, FIVE, FIVE, FIVE, FIVE]
*/
println("We have a match!") // Prints "We have a match!"

extension String {
  var reversedString: String {
    let reversedValueArray = reverse(self)
    return "".join(reversedValueArray.map { String($0) })
  }
  var isPalindromic: Bool {
    return self.lowercaseString == reversedString.lowercaseString
  }
}
let string = "AManAPlanACanalPanama"
println(string.isPalindromic) // Prints "true"

extension Optional {
  var hasValue: Bool {
  switch self {
  case .None:
    return false
  case .Some(_):
    return true
    }
  }
}
var optionalString: String?
println(optionalString.hasValue) // Prints "false"
optionalString = "Hello world"
println(optionalString.hasValue) // Prints "true"

// ******************** END Table 9-3

@objc protocol Describable {
  var description: String { get }
}
class ClassOne { }
class ClassTwo {
  var description = "ClassTwo"
}
class ClassThree {
  var description = "ClassThree"
}
extension ClassOne: Describable {
  var description: String {
  return "ClassOne"
  }
}
extension ClassThree: Describable { }
let arrayOfClasses = [ClassOne(), ClassTwo(), ClassThree()]
for value in arrayOfClasses {
  if value is Describable {
  println(value.description)
  }
}
/* Prints:
ClassOne
ClassThree
*/
