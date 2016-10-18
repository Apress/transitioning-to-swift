//  Source Code for Transitioning to Swift, Chapter 4
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

// ******************** BEGIN Table 4-1

let a = 4
let b = 2
let x = NSObject()
let y = NSObject()
let z = x
a == b // False
x == y // False
x == z // True
a != b // True
a > b // True
a < b // False
a >= (b * b) // True
a <= (b * b) // True
x === z // True
x !== y // True

// ******************** END Table 4-1

// ******************** BEGIN Table 4-2

var a = 1
let b = ++a // b = 2, a = 2
let c = a++ // c = 2, a = 3
let d = a-- // d = 3, a = 2
let e = --a // e = 1, a = 1

// ******************** END Table 4-2

// ******************** BEGIN Table 4-3

Swift
var a = 7
let b = 3
var c = "Hello "
let d = "🌎"
let e = [1, 2, 3]
let f = [4, 5, 6]
let g = UInt8.max
let h = UInt8.min
let i = a + b // i = 10
let j = c + d // j = "Hello 🌎"
var k = e + f // k = [1, 2, 3, 4, 5, 6]
a += 1 // a = 8
c += d // c = "Hello 🌎"
k += [7] // k = [1, 2, 3, 4, 5, 6, 7]
var l = a - b // l = 5
l -= b // l = 2
var m = a * b // m = 24
m *= b // k = 72
var n = 10 / 4 // n = 2
n /= 2 // n = 1
let o = 10 / 4.0 // o = 2.5 (o is inferred to be a Double)
let p = Int(10 / 4.0) // p = 2
let q = 10 % 4 // q = 2
let r = -10 % 4 // r = -2
let s = 10 % -4 // s = 2
let t = -10 % -4 // t = -2
let u = 10 % 4.0 // u = 2.0
let v = 10.5 % 4.5 // v = 1.5
let w = g &+ 1 // w = 0
let x = h &- 1 // x = 255
let y = g &* 2 // y = 254
let z = a &/ 0 // z = 0
let aa = 255 &% 0 // aa = 0
let defaultSize = "M"
var selectedSize: String?
let orderSize = selectedSize ?? defaultSize // orderSize = "M"

// ******************** END Table 4-3

// ******************** BEGIN Table 4-4

let a = 0
let b = a != 0 ? a : 5
// b = 5

// ******************** END Table 4-4

// ******************** BEGIN Table 4-5

let warmOutside = false
let raining = false
let sunny = true
let bringAJacket = !warmOutside // bringAJacket = true
let goSwimming = sunny && warmOutside // goSwimming = false
let seeMovie = !warmOutside || raining // seeMovie = true

// ******************** END Table 4-5

// ******************** BEGIN Table 4-6

let a: UInt8 = 15 // a = 00001111
let b: UInt8 = 252 // b = 11111100
let c: UInt8 = 63 // c = 00111111
let d = ~a // d = 240 = 11110000
let e = b & c // d = 60 = 00111100
let f = b | c // f = 255 = 11111111
let g = b ^ c // g = 195 = 11000011
let h = b << 1 // h = 248 = b &* 2 = 11111000
let i = b >> 1 // i = 126 = b &/ 2 = 01111110

// ******************** END Table 4-6

// ******************** BEGIN Table 4-7

struct StructA { }
struct StructB { }
let arrayOfStructureInstances: [Any] = [StructA(), StructB()]
class ParentClass { }
class Subclass: ParentClass { }
class SomeOtherClass { }
let arrayOfClassInstances = [ParentClass(), Subclass(), SomeOtherClass()]
for value in arrayOfStructureInstances {
  if value is StructA {
    println(_stdlib_getDemangledTypeName(value))
  } else {
    println("Not an instance of StructA")
  }
}
/* Prints:
...StructA
Not an instance of StructA
*/
for value in arrayOfClassInstances {
  if value is Subclass {
    let item = value as Subclass
    println(_stdlib_getDemangledTypeName(item))
  } else {
    println("Not an instance of Subclass")
  }
}
/* Prints:
Not an instance of Subclass
...Subclass
Not an instance of Subclass
*/

for  value in arrayOfClassInstances {
  if let item = value as? ParentClass {
    println(_stdlib_getDemangledTypeName(item))
  } else {
    println("Not an instance of ParentClass or a subclass")
  }
}
/* Prints:
...ParentClass
...ParentClass
Not an instance of ParentClass or a subclass
*/
let equal = "1" ~= 1
// equal = true

// ******************** END Table 4-7

let a: Double = 1 + 2 * 3 / 4 % 5 // Flat list: 1, +, 2, *, 3, /, 4, %, 5
// Transformed into tree (1 + (((2 * 3) / 4) % 5))
// a = 1 + ((6 / 4) % 5) = 1 + (1.5 % 5) = 1 + 1.5 = 2.5
