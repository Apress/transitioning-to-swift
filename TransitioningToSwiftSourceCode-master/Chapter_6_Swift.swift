//  Source Code for Transitioning to Swift, Chapter 6
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

func integer(integer: Int, equalsString string: String) -> Bool {
  return integer == string.toInt()
}
integer(1, equalsString: "2") // False

// A function that takes a function as a parameter
func processString(string: String, withSomeFunction someFunction: (String) -> ()) {
  someFunction(string)
}
func printString(string: String) {
  println(string)
}
processString("Hello world", withSomeFunction: printString)  // Prints "Hello world"

// A function that returns a function
func printer() -> (String) -> () {
  func somePrintingFunction(string: String) {
    println(string)
  }
  return somePrintingFunction
}
let printFunction = printer()
printFunction("Hello world") // Prints "Hello world"

// ******************** BEGIN Table 6-3

func printTime() {
  let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
  println(timestamp)
}
printTime() // Prints current timestamp, e.g., "Sep 9, 2014, 4:30 AM"
func printUnicodeName(#character: Character) {
  let cfMutabeString = NSMutableString(string: String(character)) as CFMutableString
  var range = CFRangeMake(0, CFStringGetLength(cfMutabeString))
  CFStringTransform(cfMutabeString, &range, kCFStringTransformToUnicodeName, 0)
  let cString = "\(cfMutabeString)"
  let startIndex = advance(cString.startIndex, 3)
  let endIndex = advance(cString.endIndex, -1)
  let unicodeName = cString.substringWithRange(Range(startIndex..<endIndex))
  println(unicodeName.capitalizedString)
}
printUnicodeName(character: "☤") // Prints "Caduceus"
class MyClass { }
class MySubClass: MyClass { }
func doSomethingWithMyClass(myClass: MyClass) {
  // ...
}
doSomethingWithMyClass(MySubClass())
func concatenateArrayOfStrings(strings: [String], withSeparator separator: String = ", ") {
  var string = ""
  for (i, s) in enumerate(strings) {
    switch i {
    case 0:
      string = strings[0]
    case 1..<strings.endIndex - 1:
      string += (separator + s)
    default:
      string += (", and \(s).")
    }
  }
  println(string)
}
concatenateArrayOfStrings(["Scott", "Lori", "Charlotte", "Betty", "Gracie", "Sophie", "Stella", "Isabella", "Lilith", "Darby"]) // Prints "Scott, Lori, Charlotte, Betty, Gracie, Sophie, Stella, Isabella, Lilith, and Darby."
import AVFoundation
func sayGreeting(greeting: String?, toName name: String?) {
  let theGreeting = greeting ?? "Hello"
  let theName = name ?? "World"
  let utterance = AVSpeechUtterance(string: "\(theGreeting) \(theName)")
  let synthesizer = AVSpeechSynthesizer()
  synthesizer.speakUtterance(utterance)
}
sayGreeting("Hi", toName: "Scott") // Speaks "Hi Scott" (works on device only)
func printHtmlTR(tdValues: String...) {
  var tr = "<tr>"
  for tdValue in tdValues {
    tr += ("<td>" + tdValue + "</td>")
  }
  tr += "</tr>"
  println(tr)
}
printHtmlTR("5 bananas", "@ $1 each", "= $5") // Print "<tr><td>5 bananas</td><td>@ $1 each</td><td>= $5</td></tr>"
func square(inout integer: Int) {
  integer *= integer
}
var number = 5
square(&number)
println(number) // Prints "25"

// ******************** END Table 6-3

// ******************** BEGIN Table 6-4

func printOut(#greeting: String, toPerson person: String) {
  println("\(greeting) \(person)!")
}
printOut(greeting: "Hello", toPerson: "Scott") // Prints "Hello Scott!"
func addInteger(n1: Int, toInteger n2: Int) -> Int {
  return n1 + n2
}
let onePlusTwo = addInteger(1, toInteger: 2) // 3
class MyClass { }
class MySubClass: MyClass {
  func printMySubClass() {
    println("MySubClass")
  }
}
func returnMySubClass(myClass: MyClass) -> MySubClass? {
  return myClass as? MySubClass
}
let someClasses: [MyClass] = [MySubClass(), MyClass()]
for (idx, item) in enumerate(someClasses) {
  if let mySubClass = returnMySubClass(item) {
    mySubClass.printMySubClass()// Prints "MySubClass" for the first item only, since the second item was not successfully downcasted
  }
}
func convertToFloat(integer: Int) -> Float {
  return Float(integer)
}
println(convertToFloat(1)) // Prints "1.0"
func addString(string1: String, toString string2: String) -> String? {
  var total: String?
  if let n1 = string1.toInt() {
    if let n2 = string2.toInt() {
      total = String(n1 + n2)
    }
  }
  return total
}
if let result = addString("1", toString: "2") {
  println(result)
}
// Prints "3"
func getIntegerAndNumberSpelledOutForNumberString(numberString: String) -> (Int, String)! {
  var returnTuple: (Int, String)?
  let spellOutFormatter = NSNumberFormatter()
  spellOutFormatter.numberStyle = .SpellOutStyle
  if let number = numberString.toInt() {
    let nsNumber = NSNumber(integer: number)
    returnTuple = (number, spellOutFormatter.stringFromNumber(number)!)
  }
  return returnTuple
}
println(getIntegerAndNumberSpelledOutForNumberString("101")) // Prints "(101, one hundred one)"

// ******************** END Table 6-4

func formatNumberAsSpelledOutString(number: Any) -> String {
  var numberString: String!
  let spellOutFormatter = NSNumberFormatter()
  spellOutFormatter.numberStyle = .SpellOutStyle
  if number is Int {
    let num = number as Int
    numberString = spellOutFormatter.stringFromNumber(num)
  } else if number is Double {
    spellOutFormatter.minimumFractionDigits = 1
    let num = number as Double
    numberString = spellOutFormatter.stringFromNumber(num)
  } else {
    numberString = "NaN"
  }
  return numberString
}

func printOutSumOfNumber(var number1: Any, var andNumber number2: Any, withFormatter formatter: (Any) -> String) -> () -> () {
  var result: String!
  func addTwoIntegers(int1: Any, int2: Any) -> Int {
    let num1 = int1 as Int
    let num2 = int2 as Int
    let sum = num1 + num2
    return sum
  }
  func addTwoDoubles(int1: Any, int2: Any) -> Double {
    let num1 = int1 as Double
    let num2 = int2 as Double
    let sum = num1 + num2
    return sum
  }
  func printResult() {
    println("The sum of \(formatter(number1)) and \(formatter(number2)) is \(result).")
  }
  switch (number1, number2) {
  case (is Int, is Int):
    number1 = number1 as Int
    number2 = number2 as Int
    let sum = addTwoIntegers(number1, number2)
    result = formatter(sum)
  case (is Int, is Double):
    number1 = Double(number1 as Int)
    number2 = number2 as Double
    let sum = addTwoDoubles(number1, number2)
    result = formatter(sum)
  case (is Double, is Int):
    number1 = number1 as Double
    number2 = Double(number2 as Int)
    let sum = addTwoDoubles(number1, number2)
    result = formatter(sum)
  case (is Double, is Double):
    number1 = number1 as Double
    number2 = number2 as Double
    let sum = addTwoDoubles(number1, number2)
    result = formatter(sum)
  default:
    result = formatter("")
  }
  return printResult
}
printOutSumOfNumber(1, andNumber: 0.23, withFormatter: formatNumberAsSpelledOutString)() // Prints "The sum of one and zero point two three is one point two three."

import Foundation
func addLineItem(product: String, #price: Double)(quantity: Int) -> (String) {
  var discountMultiplier: Double
  switch quantity {
case 1...10:
  discountMultiplier = 1.0
case 11...20:
  discountMultiplier = 0.9
default:
  discountMultiplier = 0.8
  }
  return String(format: "\(quantity) of \(product) at $%.2f each = $%.2f", price * discountMultiplier, price * Double(quantity) * discountMultiplier)
}
let sellPinotNoir = addLineItem("Pinot Noir", price: 125.0)
var lineItem = sellPinotNoir(quantity: 5)
println(lineItem) // Prints "5 of Pinot Noir at $125.00 each = $625.00"
lineItem = sellPinotNoir(quantity: 25)
println(lineItem) // Prints "25 of Pinot Noir at $100.00 each = $2500.00"

func processInput(input: String) {
  // ...
}

func processInput(input: String) -> Bool {
  // ...
  return true
}

func processInput(input: String) -> Int {
  // ...
  return 1
}

func processInput(input: Int) -> Bool {
  // ...
  return true
}

func processInput(input: Int) {
  // ...
}

func ~= (string: String, integer: Int) -> Bool {
  return string == "\(integer)"
}

func ~= (integer: Int, string: String) -> Bool {
  return "\(integer)" == string
}
println("1" ~= 1) // Prints "true"
println(1 ~= "1") // Prints "true"

infix operator <==> { precedence 130 associativity left }
func <==> (left: CGPoint, right: CGPoint) -> Bool {
  return left.x == right.x && left.y == right.y
}
let point1 = CGPoint(x: 1, y: 2)
let point2 = CGPoint(x: 1, y: 2)
println(point1 <==> point2) // Prints "true"

// ******************** BEGIN Table 6-7

var array = ["Scott", "Lori", "Charlotte", "Betty", "Gracie", "Sophie", "Stella", "Isabella", "Lilith", "Darby"]
sort(&array, { (s1: String, s2: String) -> Bool in
  return s1 < s2
})
sort(&array, { s1, s2 in s1 < s2 })
sort(&array) { $0 < $1 }
sort(&array, <)
println(array) // Prints "[Betty, Charlotte, Darby, Gracie, Isabella, Lilith, Lori, Scott, Sophie, Stella]"

// ******************** END Table 6-7

func someFunc(someOtherFunc: () -> NSTimeInterval) {
  println(someOtherFunc())
}
func getTimeInterval() -> NSTimeInterval {
  return NSDate.timeIntervalSinceReferenceDate()
}
someFunc(getTimeInterval) // Prints time interval, e.g., "431997792.008333"

func assertTruth(condition: @autoclosure () -> Bool) {
  if condition() {
    println("This is true")
  } else {
    println("This is false")
  }
}
assertTruth(1 == 2) // Prints "This is false"
let swiftIsAwesome = true
assertTruth(swiftIsAwesome) // Prints "This is true"

@noreturn func fatalErrorHandler() {
  assert(false, "Oops!")
}
fatalErrorHandler() // assertion failed: Oops!
