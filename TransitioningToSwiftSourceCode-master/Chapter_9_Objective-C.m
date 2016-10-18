//  Source Code for Transitioning to Swift, Chapter 9
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

// ******************** BEGIN Table 9-1

// In CustomClass.h
@import UIKit;
@interface Value : NSObject
@property (assign, nonatomic) NSInteger integerProperty;
@property (assign, nonatomic) CGFloat doubleProperty;
@property (copy, nonatomic, readonly) NSString *description;
- (instancetype)initWithInteger:(NSInteger)integer double:(CGFloat)doubleValue string:(NSString *)string;
- (NSString *)stringProperty;
- (void)setStringProperty:(NSString *)string;
- (void)printDescription;
@end
@interface ValueArray : Value
@property (copy, nonatomic) NSArray *integerArray;
@property (copy, nonatomic) NSArray *doubleArray;
@property (copy, nonatomic) NSArray *stringArray;
@property (assign, nonatomic) NSInteger count;
- (instancetype)initWithInteger:(NSInteger)integer double:(CGFloat)doubleValue string:(NSString *)string count:(NSInteger)count;
- (instancetype)initWithInteger:(NSInteger)integer double:(CGFloat)doubleValue string:(NSString *)string;
@end
// In CustomClass.m
#import "CustomClass.h"
@interface Value ()
@property (copy, nonatomic) NSString *changingCaseStringProperty;
@end
@implementation Value
- (instancetype)initWithInteger:(NSInteger)integer double:(CGFloat)doubleValue string:(NSString *)string
{
  if (self = [super init]) {
    _integerProperty = integer;
    _doubleProperty = doubleValue;
    _changingCaseStringProperty = string.lowercaseString;
  }
  return self;
}
- (NSString *)stringProperty
{
  return self.changingCaseStringProperty;
}
- (void)setStringProperty:(NSString *)string
{
  self.changingCaseStringProperty = string.lowercaseString;
}
- (NSString *)description
{
  return [NSString stringWithFormat:@"Values: %li, %.1f, %@", (long)self.integerProperty, self.doubleProperty, [self stringProperty]];
}
- (void)printDescription
{
  NSLog(@"%@", self.description);
}
- (void)dealloc
{
  NSLog(@"Value deallocated");
}
@end
@implementation ValueArray
- (instancetype)initWithInteger:(NSInteger)integer double:(CGFloat)doubleValue string:(NSString *)string count:(NSInteger)count
{
  if (self = [super initWithInteger:integer double:doubleValue string:string]) {
    [self setStringProperty:string.uppercaseString];
    NSMutableArray *integerArray = [@[] mutableCopy];
    NSMutableArray *doubleArray = [@[] mutableCopy];
    NSMutableArray *stringArray = [@[] mutableCopy];
    for (int i = 0; i < count; i++) {
      [integerArray addObject:@(integer)];
      [doubleArray addObject:@(round(doubleValue * 10) / 10)];
      [stringArray addObject:[self stringProperty]];
      _integerArray = integerArray;
      _doubleArray = doubleArray;
      _stringArray = stringArray;
      _count = count;
    }
    [self printDescription];
  }
  return self;
}
- (instancetype)initWithInteger:(NSInteger)integer double:(CGFloat)doubleValue string:(NSString *)string
{
  return [self initWithInteger:integer double:doubleValue string:string count:3];
}
- (NSString *)stringProperty
{
  return self.changingCaseStringProperty;
}
- (void)setStringProperty:(NSString *)string
{
  self.changingCaseStringProperty = string.uppercaseString;
}
- (NSString *)description
{
  return [NSString stringWithFormat:@"Value arrays (%li per array):\n%@\n%@\n%@", (long)self.count, self.integerArray, self.doubleArray, self.stringArray];
}
- (void)printDescription
{
  NSLog(@"%@", super.description);
  NSLog(@"%@", self.description);
}
- (void)dealloc
{
  NSLog(@"ValueArray deallocated");
}
@end
// In –[SomeOtherClass someMethod] in SomeOtherClass.m
Value *value = [[Value alloc] initWithInteger:1 double:2.3f string:@"CHARLIE"];
[value printDescription]; // Prints "Values: 1, 2.3, charlie"
__unused ValueArray *valueArray1 = [[ValueArray alloc] initWithInteger:1 double:1.2f string:@"delta"];
/* Prints:
 Values: 1, 1.2, DELTA
 Value arrays:
 (1, 1, 1)
 ("1.2", "1.2", "1.2")
 (DELTA, DELTA, DELTA)
 */
__unused ValueArray *valueArray2 = [[ValueArray alloc] initWithInteger:8 double:7.6f string:@"echo" count:4];
/* Prints:
 Values: 8, 7.6, ECHO
 Value arrays:
 (8, 8, 8, 8)
 ("7.6", "7.6", "7.6", "7.6")
 (ECHO, ECHO, ECHO, ECHO)
 */
valueArray1 = nil;
/* Prints:
 ValueArray deallocated
 Value deallocated
 ...
 */

// ******************** END Table 9-1

// ******************** BEGIN Table 9-3

// In Value+PrimeValueArray.h
#import "CustomClass.h"
typedef NSInteger (^RandomPrimeGenerator)();
@interface Value (PrimeValueArray) <NSObject>
@property (assign, nonatomic, readonly) NSInteger primeIntegerProperty;
@property (strong, nonatomic, readonly) ValueArray *primeValueArray;
- (BOOL)isEqual:(Value *)value;
@end
// In Value+PrimeValueArray.m
#import "Value+PrimeValueArray.h"
RandomPrimeGenerator randomPrimeGenerator = ^NSInteger{
start: while (YES) {
  u_int32_t randomInteger = arc4random_uniform(11);
  randomInteger = randomInteger > 1 ? randomInteger : 2;
  for (int i = 2; i <= randomInteger; i++) {
    if (randomInteger != i) {
      if (randomInteger % i == 0) {
        goto start;
      }
    }
  }
  return randomInteger;
}
};
@implementation Value (PrimeValueArray)
-(NSInteger)primeIntegerProperty
{
  return randomPrimeGenerator();
}
- (ValueArray *)primeValueArray
{
  NSInteger primeInteger = self.primeIntegerProperty;
  NSNumberFormatter *spellOutFormatter = [NSNumberFormatter new];
  spellOutFormatter.numberStyle = kCFNumberFormatterSpellOutStyle;
  NSString *string = [spellOutFormatter stringFromNumber:@(primeInteger)];
  ValueArray *valueArray = [[ValueArray alloc] initWithInteger:primeInteger double:primeInteger string:string count:primeInteger];
  return valueArray;
}
- (BOOL)isEqual:(Value *)value
{
  return self.integerProperty == value.integerProperty && self.doubleProperty == value.doubleProperty && [self.stringProperty isEqualToString:value.stringProperty];
}
@end
// In –[SomeOtherClass someMethod] in SomeOtherClass.m
Value *value1 = [[Value alloc] initWithInteger:1 double:1.0f string:@"One"];
__unused ValueArray *valueArray4 = value1.primeValueArray;
/* Prints (for example):
 Values: 5, 5, FIVE
 Value arrays:
 (5, 5, 5, 5, 5)
 (5, 5, 5, 5, 5)
 (FIVE, FIVE, FIVE, FIVE, FIVE)
 */
Value *value2 = [[Value alloc] initWithInteger:1 double:1.0f string:@"One"];
while (![value1.primeValueArray isEqual:value2.primeValueArray]) {
  NSLog(@"No match yet...");
}
/* Prints (for example):
 Values: 3, 3, THREE
 Value arrays:
 (3, 3, 3)
 (3, 3, 3)
 (THREE, THREE, THREE)
 Values: 5, 5, FIVE
 Value arrays:
 (5, 5, 5, 5, 5)
 (5, 5, 5, 5, 5)
 (FIVE, FIVE, FIVE, FIVE, FIVE)
 No match yet...
 Values: 5, 5, FIVE
 Value arrays:
 (5, 5, 5, 5, 5)
 (5, 5, 5, 5, 5)
 (FIVE, FIVE, FIVE, FIVE, FIVE)
 Values: 5, 5, FIVE
 Value arrays:
 (5, 5, 5, 5, 5)
 (5, 5, 5, 5, 5)
 (FIVE, FIVE, FIVE, FIVE, FIVE)
 */
NSLog(@"We have a match!"); // Prints "We have a match!"

// ******************** END Table 9-3
