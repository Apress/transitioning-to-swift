//  Source Code for Transitioning to Swift, Chapter 2
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

// ******************** BEGIN Table 2-1

var valueThatMayChange = "Hello "
let valueThatWillNotChange = "Hello world"

// ******************** END Table 2-1

let eAcute1 = "é"
println(_stdlib_getDemangledTypeName(eAcute1)) // Prints "Swift.String"
let eAcute2: Character = "é"
println(_stdlib_getDemangledTypeName(eAcute2)) // Prints "Swift.Character"

var firstName, lastName: String, birthYear, birthMonth, birthDay: Int // firstName and lastName are of type String; birthYear, birthMonth, and birthDay are of type Int

// ******************** BEGIN Table 2-2

typealias VolumeLevel = UInt
let volume = VolumeLevel.min

// ******************** END Table 2-2

// ******************** BEGIN Table 2-3

@availability(iOS, introduced=1.0) var anIOSOnlyValue: Int
@availability(OSX, deprecated=1.0, message="anUnusedOSXOnlyTuple has been deprecated and will be removed in a future release. Use aUsefulOSXOnlyTuple(Double, String) instead.") var anUnusedOSXOnlyTuple: (Int, String)
@availability(*, obsoleted=1.0) var anUnavailableValue: String
//anUnavailableValue = "Hello" // error: 'anUnavailableValue' is unavailable

// ******************** END Table 2-3

// ******************** BEGIN Table 2-4

var x = -1
var x: UInt = 1_000_000
var π = 3.14159
let 👍 = true
var a: Character = "ⓐ"
var greeting = "Hello"
var greeting: AnyObject = "Hello 🌎"

// ******************** END Table 2-4

// ******************** BEGIN Table 2-5

let x = -1
let x: UInt = 1_000_000
let π = 3.14159
let 👍 = true
let a: Character = "ⓐ"
let greeting = "Hello"
let greeting: AnyObject = "Hello 🌎"

// ******************** END Table 2-5

let eAcute_1 = "\u{E9}"
let eAcute_2 = "\u{65}\u{301}"
println(eAcute_1 == eAcute_2) // Prints "true"

let string1 = "The e acute character is \u{E9}"
let string2: String = "The e acute character is \u{65}\u{301}"
println(string1 == string2) // Prints "true"

// ******************** BEGIN Table 2-6

let oneTwentyDouble = 1.2e2 // 120.0
let oneTwentyInt = 1.2e2 as Int // 120
let negativeOneTwenty = -1.2e2 // -120.0
let binary15 = 0b1111 // 15
let negativeBinary15 = -0b1111 // -15
let octal15 = 0o17 // 15
let negativeOctal15 = -0o17 // -15
let hex15 = 0xf // 15
let negativeHex15 = -0xf // -15
let hexSixty = 0xfp2 // 60
let hexThreePointSevenFive = 0xfp-2 // 3.75
let hexFifteenPointFive = 0xf.8p0

// ******************** END Table 2-6

// ******************** BEGIN Table 2-7

let sectionInfo = fetchedResultsController.sections[section] as NSFetchedResultsSectionInfo

// ******************** END Table 2-7

var anEmptyStringForNow: String?

var anEmptyStringForNow2: Optional<String>

var myConditionalInt: Int?
myConditionalInt = 1
myConditionalInt = nil

var myInt1: Int? = 1
var myInt2: Int? = 2
let sum = myInt1! + myInt2!

var myInt1: Int!
myInt1 = 1
let myInt2: Int! = 2
let sum = myInt1 + myInt2
