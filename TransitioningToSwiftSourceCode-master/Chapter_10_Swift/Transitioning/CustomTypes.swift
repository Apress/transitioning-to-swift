//  Source Code for Transitioning to Swift, Chapter 10
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
//
//  CustomTypes.swift
//  Transitioning
//
//  Created by Scott Gardner on 10/8/14.
//

import Foundation
private let value1 = 1
private let value2 = "Two"
class CustomClass {
  let tuple = (value1, value2)
}
struct CustomStruct {
  let title = "CustomStruct"
  private(set) var subtitle = ""
}
let customStruct = CustomStruct()
struct Person {
  var name: String
}
func printGreeting(greeting: String, #to: Person) {
  println("\(greeting) \(to.name)!")
}
class City {
  let name: String!
  required init(name: String) {
    self.name = name
    println(name)
  }
}
struct AnotherStruct {
  let customStruct: CustomStruct
  init() {
    customStruct = CustomStruct()
    customStruct.subtitle = "A New Subtitle"
    println(customStruct.subtitle) // Prints "A New Subtitle"
  }
}
class PrivateTitleClass {
  private var title: String {
    return "PrivateTitleClass"
  }
}
class AccessibleTitleSubclass: PrivateTitleClass {
  override var title: String {
    return super.title
  }
}
struct NestingStruct {
  let nestedStruct = NestedStruct()
  struct NestedStruct {
    var title = "NestedStruct"
    init() {
      println(title)
    }
  }
}
protocol HasTitle {
  var title: String { get set }
}
protocol HasSubtitle: HasTitle {
  var subtitle: String { get set }
}
extension CustomClass {
  var title: String {
    return "CustomClass"
  }
  var subtitle: String {
    return "A Catchy Subtitle"
  }
}
