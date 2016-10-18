//  Source Code for Transitioning to Swift, Chapter 3
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

let abcString = "ABC"
countElements(abcString) // 3

abcString.startIndex // 0
abcString.endIndex // 3

let circledStar: Character = "\u{2606}\u{20DD}" // ☆⃝

let circledStarString = "\(circledStar)"
countElements(circledStarString) // 1
circledStarString.endIndex // 2

let string1 = "The e acute character is \u{E9}" // "é"
let string2 = "The e acute character is \u{65}\u{301}" // "é"
println(countElements(string1) == countElements(string2)) // Prints "true"
println(string1.endIndex == string2.endIndex) // Prints "false"
println(string1.endIndex) // Prints "26"
println(string2.endIndex) // Prints "27"
println(string1.utf16Count == string2.utf16Count) // Prints "false"
println(string1.utf16Count) // Prints "26"
println(string2.utf16Count) // Prints "27"

// ******************** BEGIN Table 3-1

let string1 = "Hello world!"
var string2 = String()
var string3 = ""
println(string1.utf16Count) // Prints "12"
println(countElements(string1)) // Prints "12"
println(string2.isEmpty) // Prints "true"
println(string1.hasPrefix("Hello")) // Prints true
println(string1.hasSuffix("earth!")) // Prints false
let C = 9.42
let d = 3.0
println("π is equal to \(C / d)") // Prints "π is equal to 3.14"
let π = String(format: "%.2f", 3.14159265358979323846)
println("π is equal to \(π)") // Prints "π is equal to 3.14"
if string2 == string3 {
  println("string2 equals string3")
}
// Prints "string2 equals string3"
let fiveString = "\(5)" // "5"
let five = fiveString.toInt()!
let pi = Double((π as NSString).doubleValue) // 3.14
var string4 = string1
string4 += " Am I alone?"
println(string1) // Prints "Hello world!"
println(string4) // Prints "Hello world! Am I alone?"
var string5 = string4
let startIndex = advance(string5.startIndex, 13)
string5.replaceRange(startIndex..<string5.endIndex, with: "How do you like me now?")
if string4 != string5 {
  println(string5)
}
// Prints "Hello world! How do you like me now?"
var tempHigh = "85"
var tempLow = "70"
let degreeF: Character = "\u{2109}"
tempHigh.append(degreeF)
tempLow.append("\u{2109}" as Character)
println("High/Low: \(tempHigh)/\(tempLow)") // Prints "High/Low: 85℉/70℉"

// ******************** END Table 3-1

var httpStatus = (200, "OK")

var httpStatus: (Int, String)?

let code = httpStatus.0
let message = httpStatus.1
println("The code is \(code) and the message is \(message).")

let (code, message) = httpStatus
println("The code is \(code) and the description is \(message).")

let httpStatus = (200, message: "OK")
println("The code is \(httpStatus.0) and the message is \(httpStatus.message).")

let (code, _) = httpStatus
println("The code is \(code).")

let (score, (firstName, _)) = (100, ("Scott", "Gardner"))
println("\(firstName) received a score of \(score).")

// ******************** BEGIN Table 3-2

let (code, message) = (200, "OK")
println("The code is \(code) and the message is \(message).")

// ******************** END Table 3-2

// ******************** BEGIN Table 3-3

var planets = ["Mercury", "Venus", "Earth"]
let planets2 = ["Mercury", "Venus"]

// ******************** END Table 3-3

var intArray1: [Int] = [1, 2, 3]
var intArray2: Array<String>?
var intArray3: [Int]?

// ******************** BEGIN Table 3-4

var stringArray = Array<String>()
var intArray = [Int]()
var myClassArray = [MyClass]()

// ******************** END Table 3-4

var anyArray = [Any]()
var anyClassArray = [AnyClass]()

var studentScores = [(String, Int)](count: 3, repeatedValue: ("Name", 100))
println(studentScores) // Prints "[(Name, 100), (Name, 100), (Name, 100)]"

// ******************** BEGIN Table 3-5

var planets = [1: "Mercury", 2: "Venus", 3: "Earth"]
let planets = [1: "Mercury", 2: "Venus", 3: "Earth"]

// ******************** END Table 3-5

var stringDictionary1: [Int: String] = [1: "One", 2: "Two"]
var stringDictionary2: Dictionary<Int, String>?
var stringDictionary3: [Int: String]?

// ******************** BEGIN Table 3-6

var stringDictionary1 = [Int: String]()
var stringDictionary2 = Dictionary<Int, String>()
var stringDictionary3 = [1: ""]
stringDictionary3 = [:]

// ******************** END Table 3-6

var dictionaryOfAnyClassTypes = [String: AnyClass]()

var tupleWithArrayWithTuplesAndDictionaryWithArrays = (([(1, 2, 3), (4, 5, 6)]),[1: ["a", "b", "c"], 2: ["d", "e", "f", "g"]])
println(tupleWithArrayWithTuplesAndDictionaryWithArrays.0) // Prints "[(1, 2, 3), (4, 5, 6)]"
println(tupleWithArrayWithTuplesAndDictionaryWithArrays.1) // Prints "[1: [a, b, c], 2: [d, e, f, g]]"
println(tupleWithArrayWithTuplesAndDictionaryWithArrays.1[2]![3]) // Prints "g"

var spade = ("Spade", symbol: "♣")
let club = ("Club", symbol: "♠")
spade.symbol = "♠"
var suits = (spade: spade, club: club)
suits.club.symbol = "♣"
println(suits.club) // Prints "(Club, ♣)"
println(club) // Prints "(Club, ♠)"

class MyClass2 {
  var myVariableProperty = "Can be changed"
}

let myClass1 = MyClass2()
let myClass1 = MyClass2()
var classTuple = (myClass1, myClass2)
classTuple.0.myVariableProperty = "Changed"

var suits: (Any, Any, Any, Any)
suits = ("Spade", "Club", "Heart", "Diamond")
suits.0 = ["Spade": "♠︎"]
suits.1 = ["Club": "♣︎"]
suits.2 = ["Heart": "♥︎"]
suits.3 = ["Diamond": "♦︎"]

// ******************** BEGIN Table 3-8

var array = [1, 2, 3, 4, 5]
println(array.isEmpty) // Prints "false"
println(array.count) // Prints "5"
let itemAtIndex3 = array[3] // 4
let rangeOf0to3 = array[0..<3] // [1, 2, 3]
let rangeOf0through3 = array[0...3] // [1, 2, 3, 4]
let foundItem = find(array, 5)! // 4
let greaterThan5 = array.filter { $0 > 3 } // [4, 5]
let reverseSortedArray = sorted(array, >) // [5, 4, 3, 2, 1]
array.sort { $0 > $1 } // [5, 4, 3, 2, 1]
array = [1, 2, 3, 4, 5]
array += [7] // [1, 2, 3, 4, 5, 7]
// array.append(7) could also have been used
array.insert(0, atIndex: 0) // [0, 1, 2, 3, 4, 5, 7]
array[6] = 6 // [0, 1, 2, 3, 4, 5, 6]
array.removeLast() // [0, 1, 2, 3, 4, 5]
let dollarsArray = array.map { "$\($0)" } // ["$0", "$1", "$2", "$3", "$4", "$5"]
let totalOfArray = array.reduce(0, +) // 15

// ******************** END Table 3-8

// ******************** BEGIN Table 3-9

var dictionary = [1: "One", 2: "Two", 3: "Three"]
println(dictionary.isEmpty) // Prints "false"
println(dictionary.count) // Prints "3"
println(dictionary[1]) // Prints "One"
let dictionaryKeys = [Int](dictionary.keys) // [1, 2, 3]
let dictionaryValues = [String](dictionary.values) // ["One", "Two", "Three"]
dictionary[4] = "Five"
println(dictionary) // Prints "[1: One, 2: Two, 3: Three, 4: Five]"
dictionary[4] = "Six" // [1: "One", 2: "Two", 3: "Three", 4: "Six"]
if let oldValue = dictionary.updateValue("Four", forKey: 4) {
  println("The value for key 4 was changed from \(oldValue) to \(dictionary[4]!)")
}
// Prints "The value for key 4 was changed from Six to Four"
dictionary[4] = nil
println(dictionary) // Prints "[1: One, 2: Two, 3: Three]"

// ******************** END Table 3-9
