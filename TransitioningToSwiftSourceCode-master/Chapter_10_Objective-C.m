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

// In CustomClass.h
@import Foundation;
@interface CustomClass : NSObject
- (void)someMethodThatAccessesAPrivateInstanceVariable;
@end
// In CustomClass.m
#import "CustomClass.h"
@interface CustomClass ()
@property (copy, nonatomic) NSString *privatePropertyString;
@end
@implementation CustomClass
{
  NSString *_privateInstanceVariableString;
}
- (instancetype)init
{
  if (self = [super init]) {
    _privatePropertyString = @"Private property string";
    _privateInstanceVariableString = @"Private instance variable string";
  }
  return self;
}
- (void)printPrivatePropertyString
{
  NSLog(@"%@", self.privatePropertyString);
}
- (void)someMethodThatAccessesAPrivateInstanceVariable
{
  NSLog(@"%@", _privateInstanceVariableString);
}
@end
// In CustomClass+Additions.h
#import "CustomClass.h"
@interface CustomClass (Additions)
@end
// In CustomClass+Additions.m
#import "CustomClass+Additions.h"
@implementation CustomClass (Additions)
- (void)printCategoryPrivateString
{
  NSLog(@"Private string in category");
}
@end
// In –[SomeOtherClass someMethod] in SomeOtherClass.m that only imports "CustomClass.h"
CustomClass *customClass = [CustomClass new];
[customClass performSelector:@selector(printPrivatePropertyString)];
[customClass performSelector:@selector(setPrivatePropertyString:) withObject:@"New private property string"];
NSLog(@"%@", [customClass performSelector:@selector(privatePropertyString)]);
[customClass someMethodThatAccessesAPrivateInstanceVariable];
[customClass performSelector:@selector(printCategoryPrivateString)];
/* Prints:
 Private property string
 New private property string
 Private instance variable string
 Private string in category
 */
