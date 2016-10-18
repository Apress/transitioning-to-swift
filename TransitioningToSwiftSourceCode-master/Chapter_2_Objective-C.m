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

typedef NSInteger VolumeLevel;
VolumeLevel volume = 0;

// ******************** END Table 2-1

// ******************** BEGIN Table 2-4

NSInteger x = -1;
NSNumber *x = @-1;
NSUInteger x = 1000000;
NSNumber *x = @1000000;
CGFloat pi = 3.14159f;
NSNumber *pi = @3.144159f;
BOOL success = YES;
NSNumber *success = @YES;
char a = 'a';
NSNumber *a = @'a';
NSMutableString *greeting =
[@"Hello" mutableCopy];
id greeting = @"Hello world";

// ******************** END Table 2-4

// ******************** BEGIN Table 2-5

const NSInteger x = -1;
const NSNumber *x = @-1;
const NSUInteger x = 1000000;
const NSNumber *x = @1000000;
const CGFloat x = 5.0f;
const NSNumber *x = @1.0f;
const BOOL success = YES;
const NSNumber *success = @YES;
const char a = 'a';
const NSNumber *a = @'a';
NSString *greeting = @"Hello";
const id greeting = @"Hello world";

// ******************** END Table 2-5

// ******************** BEGIN Table 2-6

CGFloat oneTwentyDouble = 1.2e2; // 120.0
NSInteger oneTwentyInt = 1.2e2; // 120
CGFloat negativeOneTwenty = -1.2e2; // -120.0
NSInteger binary15 = 0b1111; // 15
NSInteger negativeBinary15 = -0b1111; // -15
NSInteger octal15 = 017; // 15
NSInteger negativeOctal15 = -017; // -15
NSInteger hex15 = 0xf; // 15
NSInteger negativeHex15 = -0xf; // -15
CGFloat hexSixty = 0xfp2; // 60
CGFloat hexThreePointSevenFive = 0xfp-2; // 3.75
CGFloat hexFifteenPointFive = 0xf.8p0;

// ******************** END Table 2-6

// ******************** BEGIN Table 2-7

id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController.sections[section];

// ******************** END Table 2-7
