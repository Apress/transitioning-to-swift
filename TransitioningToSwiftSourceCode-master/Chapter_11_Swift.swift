//  Source Code for Transitioning to Swift, Chapter 11
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

var intArray: Array<Int> // An array of type Int
var intStringDictionary: Dictionary<Int, String> // A dictionary that can hold key-value pairs of type Int and String, respectively

class CustomClass: Printable {
  var description = "CustomClass"
}
struct CustomStruct: Printable {
  var description = "CustomClass"
}
enum CustomEnum: String, Printable {
  case One = "One"
  case Two = "Two"
  var description: String {
    return "CustomEnum.\(self.rawValue)"
  }
}
let customClass = CustomClass()
let customStruct = CustomStruct()
let customEnum = CustomEnum.One
var arrayOfPrintableItems: Array<Printable> = [customClass, customStruct, customEnum]
var dictionaryOfPrintableItems: Dictionary<Int, Printable> = [1: customClass, 2: customStruct, 3: customEnum]

class CustomClass: DebugPrintable {
  var debugDescription = "CustomClass"
}
class Holder<T> {
  var items: [T]
  init(_ items: [T]) {
    self.items = items
  }
  subscript(index: Int) -> String {
    let typeName = _stdlib_getDemangledTypeName(items[index])
    return "\(typeName): \(items[index])"
  }
}
let intHolder = Holder([1, 2, 3])
println(intHolder.items) // Prints "[1, 2, 3]"
println(intHolder[0]) // Prints "Swift.Int: 1"
let doubleHolder = Holder([1.1, 2.2, 3.3])
println(doubleHolder.items) // Prints "[1.1, 2.2, 3.3]"
println(doubleHolder[0]) // Prints "Swift.Double: 1.1"
let stringHolder = Holder(["One", "Two", "Three"])
println(stringHolder.items) // Prints "[One, Two, Three]"
println(stringHolder[0]) // Prints "Swift.String: One"
let customClassHolder = Holder([CustomClass(), CustomClass(), CustomClass()])
println(customClassHolder.items) // Prints "[CustomClass, CustomClass, CustomClass]"
println(customClassHolder.items[0]) // Prints "CustomClass"

protocol Edible {
  var name: String { get }
  var caloriesPerServing: Int { get }
}
struct Ingredient: Edible, Printable {
  let name: String
  let caloriesPerServing: Int
  var description: String {
    return "\(name) (\(caloriesPerServing) calories per serving)"
  }
  init(_ name: String, _ caloriesPerServing: Int) {
    self.name = name
    self.caloriesPerServing = caloriesPerServing
  }
}
struct TrailMix<T: Edible where T: Printable>: Printable {
  var ingredients: [T]
  var description: String {
    var caloriesPerServing = 0
    var description = ""
    let count = countElements(ingredients)
    for ingredient in ingredients {
      caloriesPerServing += ingredient.caloriesPerServing / count
      description += "• \(ingredient.description)\n"
    }
    return "Trail mix, calories per serving: \(caloriesPerServing)\nIngredients:\n\(description)"
  }
  init(_ ingredients: [T]) {
    self.ingredients = ingredients
  }
}
let chocolateChips = Ingredient("Chocolate chips", 201)
let driedFruit = Ingredient("Dried fruit", 85)
let granola = Ingredient("Granola", 113)
let mixedNuts = Ingredient("Mixed nuts", 219)
let miniPretzels = Ingredient("Mini pretzels", 110)
var trailMix = TrailMix([chocolateChips, driedFruit, granola, mixedNuts, miniPretzels])
println(trailMix.description)
/* Prints:
Trail mix, calories per serving: 144
Ingredients:
• Chocolate chips (201 calories per serving)
• Dried fruit (85 calories per serving)
• Granola (113 calories per serving)
• Mixed nuts (219 calories per serving)
• Mini pretzels (110 calories per serving)
*/

enum OptionalType<T> {
  case None
  case Some(T)
  init() {
    self = .None
  }
}
var someOptionalValue = OptionalType<String>()
switch someOptionalValue {
case .None:
  println("No value")
case .Some(let value):
  println(value)
}
// Prints "No value"
someOptionalValue = .Some("Hello world!")
switch someOptionalValue {
case .None:
  println("No value")
case .Some(let value):
  println(value)
}
// Prints "Hello world!"

protocol HasMiddleValue {
  typealias T
  func middle() -> [T]?
}
extension Array: HasMiddleValue {
  func middle() -> [T]? {
    if self.count > 0 {
      var middleIndex = self.count / 2 - 1
      var middleArray = [T]()
      if self.count % 2 == 0 {
        let middleIndex1 = middleIndex
        let middleIndex2 = middleIndex1 + 1
        middleArray = [self[middleIndex1], self[middleIndex2]]
      } else {
        middleArray = [self[middleIndex + 1]]
      }
      return middleArray
    }
    return nil
  }
}
let arrayOfEvenNumberOfInts = [1, 2, 3, 4, 5]
println(arrayOfEvenNumberOfInts.middle()!) // Prints "[3]"
let arrayOfOddNumberOfStrings = ["A", "B", "C", "D"]
println(arrayOfOddNumberOfStrings.middle()!) // Prints "[B, C]"
