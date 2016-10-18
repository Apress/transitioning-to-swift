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

NSInteger a = 4;
NSInteger b = 2;
NSObject *x = [NSObject new];
NSObject *y = [NSObject new];
NSObject *z = x;
a == b // False
x == y // False
x == z // True
a != b // True
x != y // True
a > b // True
a < b // False
a >= (b * b) // True
a <= (b * b) // True

// ******************** END Table 4-1

// ******************** BEGIN Table 4-2

NSInteger a = 1;
NSInteger b = ++a; // b = 2, a = 2
NSInteger c = a++; // c = 2, a = 3
NSInteger d = a--; // d = 3, a = 2
NSInteger e = --a; // e = 1, a = 1

// ******************** END Table 4-2

// ******************** BEGIN Table 4-3

NSInteger a = 7;
NSInteger b = 3;
uint8_t g = 255;
uint8_t h = 0;
NSInteger i = a + b; // i = 10
a += 1 // a = 8
NSInteger l = a - b; // l = 5
l -= b; // l = 2
NSInteger m = a * b; // m = 24
m *= b; // k = 72
NSInteger n = 10 / 4; // n = 2
n /= 2; // l = 1
CGFloat o = 10 / 4.0f; // o = 2.5
NSInteger q = 10 % 4; // q = 2
NSInteger r = -10 % 4; // r = -2
NSInteger s = 10 % -4; // s = 2
NSInteger t = -10 % -4; // t = -2
uint8_t w = g + 1; // w = 0
uint8_t x = h - 1; // x = 255
uint8_t y = g * 2; // y = 254
uint8_t z = a / 0; // Division by zero is undefined
uint8_t aa = 255 % 0; // Remainder by zero is undefined

// ******************** END Table 4-3

// ******************** BEGIN Table 4-5

BOOL warmOutside = NO;
BOOL raining = NO;
BOOL sunny = YES;
BOOL bringAJacket = !warmOutside;
// bringAJacket = YES
BOOL goSwimming = sunny && warmOutside;
// goSwimming = NO
BOOL seeMovie = !warmOutside || raining;
// seeMovie = YES

// ******************** END Table 4-5

// ******************** BEGIN Table 4-6

uint8_t a = 15; // a = 00001111
uint8_t b = 252; // b = 11111100
uint8_t c = 63; // c = 00111111
uint8_t d = ~a; // d = 240 = 11110000
uint8_t e = b & c; // e = 60 = 00111100
uint8_t f = b | c; // f = 255 = 11111111
uint8_t g = b ^ c; // g = 195 = 11000011
uint8_t h = b << 1; // h = 248 = b * 2 = 11111000
uint8_t i = b >> 1; // i = 126 = b / 2 = 01111110

// ******************** END Table 4-6

// ******************** BEGIN Table 4-7

// In MyCustomClass.h
@import Foundation;
@interface ParentClass : NSObject
@end
@interface Subclass : ParentClass
@end
@interface SomeOtherClass : NSObject
@end
// In MyCustomClass.m
@implementation ParentClass
@end
@implementation Subclass
@end
@implementation SomeOtherClass
@end
// In -[AnotherClass someMethod] in AnotherClass.m
NSArray *arrayOfClassInstances = @[[ParentClass new], [Subclass new], [SomeOtherClass new]];
// In -[AnotherClass someMethod] in AnotherClass.m
for (id value in arrayOfClassInstances) {
  if ([value isKindOfClass:[ParentClass class]]) {
    NSLog(@"%@", NSStringFromClass([value class]));
  } else {
    NSLog(@"Not an instance of Subclass or ParentClass");
  }
}
/* Prints:
 ParentClass
 Subclass
 Not an instance of Subclass or ParentClass
 */
// In -[AnotherClass someMethod] in AnotherClass.m
for (id value in arrayOfClassInstances) {
  Subclass *item = (Subclass *)value;
  if ([item isKindOfClass:[Subclass class]]) {
    NSLog(@"%@", NSStringFromClass([item class]));
  } else {
    NSLog(@"Not an instance of Subclass");
  }
}
/* Prints:
 Not an instance of Subclass
 Subclass
 Not an instance of Subclass
 */

// ******************** END Table 4-7
