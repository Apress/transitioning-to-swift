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

// ******************** BEGIN Table 3-1

NSString *string1 = @"Hello world!";
NSMutableString *string2 = [NSMutableString new];
NSMutableString *string3 = [@"" mutableCopy];
NSLog(@"%lu", (unsigned long)string1.length); // Prints "12"
NSLog(@"%i", !string2.length); // Prints "1"
NSLog(@"%i", [string1 hasPrefix:@"Hello"]); // Prints "1"
NSLog(@"%i", [string1 hasSuffix:@"earth!"]); // Prints "0"
CGFloat C = 9.42f;
NSInteger d = 3;
NSLog(@"π is equal to %.2f", C / d); // Prints "π is equal to 3.14"
NSLog(@"π is equal to %.2f", 3.14159265358979323846); // Prints "π is equal to 3.14"
if ([string2 isEqualToString:string3]) {
  NSLog(@"string2 equals string3");
}
// Prints "string2 equals string3"
NSString *fiveString = [@5 stringValue]; // "5"
NSInteger five = [fiveString integerValue];
NSMutableString *string4 = [string1 mutableCopy];
[string4 appendFormat:@" Am I alone?"];
NSLog(@"%@", string1); // Prints "Hello world!"
NSLog(@"%@", string4); // Prints "Hello world! Am I alone?"
NSMutableString *string5 = string4;
[string5 replaceCharactersInRange:NSMakeRange(13, 10) withString:@"How do you like me now"];
if ([string4 isEqualToString:string5]) {
  NSLog(@"%@", string5);
}
// Prints "Hello world! How do you like me now?"
NSMutableString *tempHigh = [@"85" mutableCopy];
NSMutableString *tempLow = [@"70" mutableCopy];
NSString *degreeF = @"\u2109";
[tempHigh appendString:degreeF];
[tempLow appendString:degreeF];
NSLog(@"High/Low: %@/%@", tempHigh, tempLow); // Prints "High/Low: 85℉/70℉"

// ******************** END Table 3-1

// ******************** BEGIN Table 3-2

NSUInteger code = 200;
NSString *message = @"OK";
NSLog(@"The code is %lu and the message is %@.", (unsigned long)code, message);

// ******************** END Table 3-2

// ******************** BEGIN Table 3-3

NSMutableArray *planets = [@[@"Mercury", @"Venus", @"Earth"] mutableCopy];
NSArray *planets = @[@"Mercury", @"Venus"];

// ******************** END Table 3-3

// ******************** BEGIN Table 3-4

NSMutableArray *arrayOfAnyObjects = [NSMutableArray array];

// ******************** END Table 3-4

// ******************** BEGIN Table 3-5

NSMutableDictionary *planets = [@{@1: @"Mercury", @2: @"Venus", @3: @"Earth"} mutableCopy];
NSDictionary *planets = [@{@1: @"Mercury", @2: @"Venus", @3: @"Earth"} mutableCopy];

// ******************** END Table 3-5

// ******************** BEGIN Table 3-8

NSMutableArray *array = [@[@1, @2, @3, @4, @5] mutableCopy];
NSLog(@"array is empty? %@", array.count ? @"NO" : @"YES"); // Prints "NO"
NSLog(@"%lu", (unsigned long)array.count); // Prints "5"
NSNumber *itemAtIndex3 = array[3]; // 4
NSArray *rangeOf0to3 = [array subarrayWithRange:NSMakeRange(0, 3)]; // (1, 2, 3)
NSArray *rangeOf0through3 = [array subarrayWithRange:NSMakeRange(0, 4)]; // (1, 2, 3, 4)
NSInteger index = [array indexOfObject:@5];
NSNumber *foundItem = array[index]; // 5
NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self > 3"];
NSArray *greaterThan3 = [array filteredArrayUsingPredicate:predicate]; // (4, 5)
NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
NSArray * reverseSortedArray = [[array sortedArrayUsingDescriptors:@[descriptor]] mutableCopy]; // (5, 4, 3, 2, 1)
[array addObject:@7]; // (1, 2, 3, 4, 5, 7)
[array insertObject:@0 atIndex:0]; // (0, 1, 2, 3, 4, 5, 7)
array[6] = @6; // (0, 1, 2, 3, 4, 5, 6)
[array removeLastObject]; // (0, 1, 2, 3, 4, 5)
NSMutableArray *dollarsArray = [NSMutableArray array];
[array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
  [dollarsArray addObject:[NSString stringWithFormat:@"%@%@", @"$", obj]];
}];
NSLog(@"%@", dollarsArray); // Prints "("$0", "$1", "$2", "$3", "$4", "$5")"
int totalOfArray;
for (NSNumber *i in array) {
  totalOfArray += [i intValue];
}
NSLog(@"%i", totalOfArray); // Prints "15"

// ******************** END Table 3-8

// ******************** BEGIN Table 3-9

NSMutableDictionary *dictionary = [@{@1: @"One", @2: @"Two", @3: @"Three"} mutableCopy];
NSLog(@"%@", dictionary.count ? @"NO" : @"YES"); // Prints "NO"
NSLog(@"%lu", (unsigned long)dictionary.count); // Prints "3"
NSLog(@"%@", dictionary[@1]); // Prints "One"
NSArray *dictionaryKeys = [dictionary allKeys]; // (3, 1, 2)
NSArray *dictionaryValues = [dictionary allValues]; // (Three, One, Two)
dictionary[@4] = @"Five";
NSLog(@"%@", dictionary); // Prints "(3 = Three, 2 = Two, 1 = One, 4 = Five)"
dictionary[@4] = @"Four"; // (3 = Three, 2 = Two, 1 = One, 4 = Four)
[dictionary removeObjectForKey:@4];
NSLog(@"%@", dictionary); // Prints "(3 = Three, 2 = Two, 1 = One)"

// ******************** END Table 3-9
