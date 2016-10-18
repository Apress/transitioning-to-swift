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
//  ViewController.swift
//  Transitioning
//
//  Created by Scott Gardner on 10/8/14.
//

import UIKit
import CustomFramework
class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Enter forthcoming example code here
    let customClass = CustomClass()
    let customFrameworkClass = CustomFrameworkClass()
    println(customClass.tuple) // Prints "(1, Two)"
    println(customFrameworkClass.tuple) // Prints "(1, Two)"
    customFrameworkClass.tuple.0 = 3
    customFrameworkClass.tuple.1 = "Four"
    println(customFrameworkClass.tuple) // Prints "(3, Four)"
    
    let customFrameworkEnum = CustomFrameworkEnum.TwoWithAssociatedValue(CustomFrameworkStruct())
    switch customFrameworkEnum {
    case .One:
      println("One")
    case .TwoWithAssociatedValue(let customFrameworkStruct):
      println(customFrameworkStruct.title)
    }
    // Prints "CustomFrameworkStruct"
    
    let customStruct = CustomStruct()
    println(customStruct.title) // Prints "CustomStruct"
    
    printGreeting("Hello", to: Person(name: "Charlotte")) // Prints "Hello Charlotte!"
    
    let boston = City(name: "Boston")
    
    let anotherStruct = AnotherStruct() // Prints "A New Subtitle"
    
    var accessibleTitleSubclass = AccessibleTitleSubclass()
    println(accessibleTitleSubclass.title) // Prints "PrivateTitleClass"
    
    let nestingStruct = NestingStruct()
    println(nestingStruct.nestedStruct.title) // Prints "NestedStruct"
    
    struct Media: HasSubtitle {
      var title = "A Good Title"
      var subtitle = "A Catchy Subtitle"
    }
    let media = Media()
    println(media.subtitle) // Prints "A Catchy Subtitle"
    
    println(customClass.title) // Prints "CustomClass"
    println(customClass.subtitle) // Prints "CustomClass"
    
    let cfStruct = CFStruct()
    println(cfStruct.title) // Prints "CustomFrameworkStruct"
  }
  
}
