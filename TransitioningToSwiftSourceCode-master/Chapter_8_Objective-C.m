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

// In .h interface file
@import Foundation;
@protocol Protocol <NSObject>
@property (copy, nonatomic) NSString *requiredProperty;
- (void)requiredMethod;
@optional
@property (assign, nonatomic) NSInteger optionalProperty;
- (void)optionalMethod;
@end

// ******************** END Table 8-2

// ******************** BEGIN Table 8-3

Objective-C
@interface CustomClass : NSObject <Protocol1, Protocol2>
id<Protocol1, Protocol2> delegate;
@property (strong, nonatomic) id<Protocol1, Protocol2> delegate;

// ******************** END Table 8-3

// ******************** BEGIN Table 8-4

// In CustomClass.h
@import Foundation;
@protocol HasString <NSObject>
@property (copy, nonatomic) NSString *string;
@end
@protocol Printable <NSObject, HasString>
- (void)printString;
@end
@protocol HasReversedString <NSObject>
@property (copy, nonatomic) NSString *reversedString;
@end
@protocol IsPalindromic <NSObject>
@property (assign, nonatomic) BOOL isPalindromic;
@end
@interface CustomClass : NSObject <Printable, HasReversedString, IsPalindromic>
@property (copy, nonatomic) NSString *string;
@property (copy, nonatomic) NSString *reversedString;
@property (assign, nonatomic) BOOL isPalindromic;
- (void)printString;
- (void)printReversedString;
@end
// In CustomClass.m
#import "CustomClass.h"
@implementation CustomClass
- (instancetype)init
{
  if (self = [super init]) {
    _string = @"AManAPlanACanalPanama";
  }
  return self;
}
- (NSString *)reversedString
{
  NSMutableString *reversedString = [@"" mutableCopy];
  [self.string enumerateSubstringsInRange:NSMakeRange(0, self.string.length) options:(NSStringEnumerationReverse|NSStringEnumerationByComposedCharacterSequences) usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
    [reversedString appendString:substring];
  }];
  _reversedString = reversedString;
  return _reversedString;
}
- (BOOL)isPalindromic
{
  return [self.string.lowercaseString isEqualToString:self.reversedString.lowercaseString];
}
- (void)printString
{
  NSLog(@"%@", self.string);
}
- (void)printReversedString
{
  NSLog(@"%@", self.reversedString);
}
@end
// In –[SomeOtherClass someMethod] in SomeOtherClass.m
CustomClass *printableValue = [CustomClass new];
[printableValue printReversedString]; // Prints "amanaPlanaCAnalPAnaMA"
NSLog(@"%@", printableValue.isPalindromic ? @"YES" : @"NO"); // Prints "YES"

// ******************** END Table 8-4
