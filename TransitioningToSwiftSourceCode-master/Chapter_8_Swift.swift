//  Source Code for Transitioning to Swift, Chapter 8
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

// ******************** BEGIN Table 8-2

protocol RequiredProtocol: AnotherProtocol {
  var requiredProperty: String { get set }
  func requiredMethod()
}
@objc protocol PartiallyOptionalProtocol {
  var requiredProperty: String { get set }
  func requiredMethod()
  optional var optionalProperty: Int { get set }
  optional func optionalMethod()
}

// ******************** END Table 8-2

protocol CanHandleFatalError {
  @noreturn func fatalErrorHandler()
}
struct ErrorHandler: CanHandleFatalError {
  @noreturn func fatalErrorHandler() {
    assert(false, "Oops!")
  }
}
let errorHandler = ErrorHandler()
errorHandler.fatalErrorHandler() // assertion failed: Oops!

protocol CanTellTheTruth {
  func assertTruth(condition: @autoclosure () -> Bool)
}
class TruthTeller: CanTellTheTruth {
  func assertTruth(condition: @autoclosure () -> Bool) {
    if condition() {
      println("This is true")
    } else {
      println("This is false")
    }
  }
}
let truthTeller = TruthTeller()
truthTeller.assertTruth(1 == 2) // Prints "This is false"
let swiftIsAwesome = true
truthTeller.assertTruth(swiftIsAwesome) // Prints "This is true"

// ******************** BEGIN Table 8-3

class CustomClass: ParentClass, Protocol1, Protocol2 { }
  struct CustomStruct: Protocol1, Protocol2 { }
  enum CustomEnum: Int, Protocol1, Protocol2 { }
  var storedValue1: Protocol1
  var storedValue2: protocol<Protocol1, Protocol2>
  var array1: [Protocol1]
  var array2: [protocol<Protocol1, Protocol2>]
  var dictionary1: [AnyKey: Protocol1]
  var dictionary2: [AnyKey: protocol<Protocol1, Protocol2>]
  var tuple1: (Protocol1, Protocol2)
  var tupel2: (Protocol1, protocol<Protocol2, Protocol3>)

// ******************** END Table 8-3

// ******************** BEGIN Table 8-4

protocol HasString {
  var string: String { get set }
}
protocol Printable: HasString {
  func printString()
}
@objc protocol HasReversedString {
  var reversedString: String { get }
  optional func printReversedString()
}
protocol IsPalindromic {
  var isPalindromic: Bool { get }
}
protocol MakePalindromic {
  mutating func convertToPalindrome()
}
class CustomClass: Printable, HasReversedString, IsPalindromic {
  var string: String = "AManAPlanACanalPanama"
  var reversedString: String {
    let reversedValueArray = reverse(string)
    return "".join(reversedValueArray.map { String($0) })
  }
  var isPalindromic: Bool {
    return string.lowercaseString == reversedString.lowercaseString
  }
  init () { }
  init(string: String) {
    self.string = string
  }
  func printString() {
    println(string)
  }
  func printReversedString(){
    println(reversedString)
  }
}
var printableValue: CustomClass = CustomClass()
printableValue.printReversedString() // Prints "amanaPlanaCAnalPAnaMA"
println(printableValue.isPalindromic) // Prints "true"

// ******************** END Table 8-4

import Foundation
class CopyingClass: NSCopying {
  func copyWithZone(zone: NSZone) -> AnyObject {
  return CopyingClass()
  }
}
class ClassWithProperties {
  var nonCopyingProperty: CopyingClass {
    didSet {
      println("self.nonCopyingProperty === oldValue: \(self.nonCopyingProperty === oldValue)")
    }
  }
  @NSCopying var copyingProperty: CopyingClass {
    didSet {
      println("self.copyingProperty === oldValue: \(self.copyingProperty === oldValue)")
    }
  }
  init(nonCopyingProperty: CopyingClass, copyingProperty: CopyingClass) {
    self.nonCopyingProperty = nonCopyingProperty
    self.copyingProperty = copyingProperty
  }
}
let copyingClass = CopyingClass()
let classWithProperties = ClassWithProperties(nonCopyingProperty: copyingClass, copyingProperty: copyingClass)
classWithProperties.nonCopyingProperty = copyingClass // Prints "self.nonCopyingProperty === oldValue: true"
classWithProperties.copyingProperty = copyingClass // Prints "self.copyingProperty === oldValue: false"

// ******************** BEGIN Table 8-5

struct CustomStruct: IsPalindromic, MakePalindromic {
  var valuesArray: [CustomClass]
  var isPalindromic: Bool {
    var isPalindromic = true
    let lastIndex = valuesArray.endIndex - 1
    let halfCount = Int(valuesArray.count / 2)
    for i in 0..<halfCount {
      let x = valuesArray[i].string
      let y = valuesArray[lastIndex - i].string
      if x != y {
        isPalindromic = false
        break
      }
    }
    return isPalindromic
  }
  mutating func convertToPalindrome() {
    if !isPalindromic {
      var reversedArray = reverse(valuesArray)
      valuesArray = valuesArray + reversedArray
    }
    let valuesString = " ".join(valuesArray.map { "[\($0.string)]" })
    println(valuesString)
  }
}
let alpha = CustomClass(string: "Alpha")
let bravo = CustomClass(string: "Bravo")
let charlie = CustomClass(string: "Charlie")
let delta = CustomClass(string: "Delta")
let foxtrot = CustomClass(string: "Foxtrot")
var customStruct: protocol<IsPalindromic, MakePalindromic> = CustomStruct(valuesArray: [alpha, bravo, charlie, delta, foxtrot])
println(customStruct.isPalindromic) // Prints "false"
customStruct.convertToPalindrome() // Prints "[Alpha] [Bravo] [Charlie] [Delta] [Foxtrot] [Foxtrot] [Delta] [Charlie] [Bravo] [Alpha]"
println(customStruct.isPalindromic) // Prints "true"
enum CustomEnum: Int, Printable {
  case One = 1, Two, Three
  var string: String {
    get {
    var value: String
    switch self {
    case .One:
      value = "One"
    case .Two:
      value = "Two"
    case .Three:
      value = "Three"
      }
      return value
    }
    set {
      let value = newValue.toInt() ?? 1
      self = CustomEnum(rawValue: value)!
    }
  }
  func printString() {
    println(string)
  }
}
var customEnum = CustomEnum.One
customEnum.string = "a"
customEnum.printString() // Prints "One"

// ******************** END Table 8-5

@objc protocol HasTitle {
  var title: String { get set }
}
@objc protocol HasPageCount {
  var pageCount: Int { get set }
  optional var title: String { get set }
}
class Book: HasTitle, HasPageCount {
  var title: String
  var pageCount: Int
  var tableOfContents: String!
  init(title: String, pageCount: Int) {
    self.title = title
    self.pageCount = pageCount
    tableOfContents = "\tTable Of Contents\n\t..."
  }
  func goToChapter(chapter: Int) {
    // ...
    println("Going to chapter \(chapter)")
  }
}
class Article: HasTitle, HasPageCount {
  var title: String
  var pageCount: Int
  init(title: String, pageCount: Int) {
    self.title = title
    self.pageCount = pageCount
  }
}
class Video: HasTitle {
  var title: String
  init(title: String) {
    self.title = title
  }
}
let book = Book(title: "Transitioning to Swift", pageCount: 200)
let article = Article(title: "How to Perform a Lightweight Core Data Migration", pageCount: 25)
let video = Video(title: "How To Use Xcode Behaviors")
let publishedWorks: [HasTitle] = [book, article, video]
for item in publishedWorks {
  if let printItem = item as? HasPageCount {
    let pageString = printItem.pageCount == 1 ? "page" : "pages"
    println("\(printItem.title!) has \(printItem.pageCount) \(pageString)")
    if let bookItem = printItem as? Book {
      println(bookItem.tableOfContents)
    }
  } else {
    println("\(item.title) is a video")
  }
}
/*
Prints:
Transitioning to Swift has 200 pages
Table Of Contents
...
How to Perform a Lightweight Core Data Migration has 25 pages
How To Use Xcode Behaviors is a video
*/
