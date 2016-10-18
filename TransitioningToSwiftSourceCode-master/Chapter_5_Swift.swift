//  Source Code for Transitioning to Swift, Chapter 5
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

var range1 = 1...5 // Closed range, represents 1, 2, 3, 4, 5
var range2 = 1..<5 // Half-open range, represents 1, 2, 3, 4
let range3 = -3...3 // Closed range, represents -3, -2, -1, 0, 1, 2, 3
range1.startIndex = 5
range1.isEmpty // False
range2.endIndex = 1
range2.isEmpty // True

let fiveToOne = lazy(1...5).reverse()
for i in fiveToOne {
  print("\(i) ") // Prints "5 4 3 2 1 "
}

let stride1 = stride(from: 10, to: -10, by: -1) // Represents 10, 9, 8, ... to -9 (20 values total)
let stride2 = stride(from: 0.0, through: 3.14, by: 0.1) // Represents 0.0, 0.1, 0.2, ... to 3.14 (32 values total)

// ******************** BEGIN Table 5-2

let testScore = 100
let speedTrap = (speed1: 50, speed2: 85, time: 6)
var nameTextFieldText: String?
if let name = nameTextFieldText {
  println("Hello \(name)!")
} else {
  println("Welcome guest!")
}
// Prints "Welcome guest!"
switch testScore {
case 100:
  print("You aced it! ")
  fallthrough
case 98, 99:
  print("Great job! ")
  fallthrough
case 0...100:
  print("Your grade: ")
  fallthrough
case 95..<100:
  println("A+")
case 90..<95:
  println("A")
case 85..<90:
  println("B+")
case 80..<85:
  println("B")
default:
  println("Better study more next time.")
}
// Prints "You aced it! Great job! Your grade: A+"
switch speedTrap {
case (_, let s2, _) where s2 > 90:
  println("Reckless driving")
case let (s1, s2, t) where (s2 - s1) / t > 4:
  println("Exhibition of acceleration")
default:
  break
}
// Prints "Exhibition of acceleration"

// ******************** END Table 5-2

// ******************** BEGIN Table 5-3

override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
  switch (segue.identifier, segue.destinationViewController) {
  case let (i, d as DetailViewController) where i == "Item Detail":
    d.title = i
  d.itemForDetail = item
  case let (i, nc as UINavigationController) where i == "Related Items":
    let r = nc.topViewController as RelatedViewController
  r.title = i
  r.category = item.category
  default:
    break;
  }
}

// ******************** END Table 5-3

// ******************** BEGIN Table 5-4

func rollDie () -> UInt32 {
  return arc4random_uniform(6) + 1
}
var die1 = rollDie()
var die2 = rollDie()
while die1 != 1 && die2 != 1 {
  println("\(die1) & \(die2)")
  die1 = rollDie()
  die2 = rollDie()
}
println("Snake eyes!")
do {
  die1 = rollDie()
  die2 = rollDie()
  println("\(die1) & \(die2)")
} while die1 != 1 && die2 != 1
println("Snake eyes!")

// ******************** END Table 5-4

// ******************** BEGIN Table 5-5

let numbers = [1: "One", 2: "Two", 3: "Three"]
for i in 1...3 {
  print("\(i) ")
}
// Prints "1 2 3 "
for i in stride(from: 10, to: 0, by: -2) {
  print("\(i) ")
}
// Prints "10 8 6 4 2 "
for (k, v) in numbers {
  if k == 2 {
    continue
  }
  println("\(k): \(v)")
}
// Prints "1: One  3: Three"
for i in reverse(1...3) {
  print("\(i) ")
}
// Prints "3 2 1 "
for c in enumerate("STARRING") {
  println(c.1)
}
// Prints each letter of "STARRING" on a new line

// ******************** END Table 5-5

// ******************** BEGIN Table 5-6

start: while true {
  let randomNumber = arc4random_uniform(100)
  switch randomNumber {
  case 55:
    println(" - Finally!")
    break start
  case 0...100:
    println()
    print("randomNumber = \(randomNumber)")
    continue start
  default:
    break
  }
}

// ******************** END Table 5-6
