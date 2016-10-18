//  Source Code for Transitioning to Swift, Chapter 7
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

// ******************** BEGIN Table 7-6

// In MyCustomClass.h
@import Foundation;
static NSString *defaultTitle = @"A Worthy Title";
@interface MyCustomClass : NSObject
@property (copy, nonatomic) NSString *title;
+ (instancetype)instanceWithDefaultTitle;
- (instancetype)initWithTitle:(NSString *)title;
@end
// In MyCustomClass.m
#import "MyCustomClass.h"
@implementation MyCustomClass
+ (instancetype)instanceWithDefaultTitle
{
  return [[MyCustomClass alloc] initWithTitle:nil];
}
- (instancetype)initWithTitle:(NSString *)title
{
  if (self = [super init]) {
    _title = title ?: defaultTitle;
  }
  return self;
}
@end
// In –[SomeOtherClass someMethod] in SomeOtherClass.m
MyCustomClass *myCustomClass1 = [MyCustomClass instanceWithDefaultTitle]; // myCustomClass1.title = "A Worthy Title"
MyCustomClass *myCustomClass2 = [[MyCustomClass alloc] initWithTitle:@"A Great Title"]; // myCustomClass2.title = "A Great Title"

// ******************** END Table 7-6

// ******************** BEGIN Table 7-7

typedef struct {
  char *date;
  char *message;
  NSInteger value;
} MyStruct;
MyStruct myStruct1 = { "9/9/14", "Hello iPhone", 6 };
MyStruct myStruct2 = { .message = "goodbye iPhone", .value = 5 };
NSLog(@"%s: %s %li, %s %li", myStruct1.date, myStruct1.message, (long)myStruct1.value, myStruct2.message, (long)myStruct2.value); // Prints "9/9/14: Hello iPhone 6, goodbye iPhone 5"

// ******************** END Table 7-7

// ******************** BEGIN Table 7-8

typedef NS_ENUM(NSInteger, MyEnum) {
  value1, value2, value3
};
MyEnum myEnum = value1;
NSLog(@"%i", myEnum); // Prints 0
typedef NS_OPTIONS(NSInteger, MyOptionsEnum) {
  v1 = 1 << 0,
  v2 = 1 << 1,
  v3 = 1 << 2
};
MyOptionsEnum myOptionsEnum = v3;
NSLog(@"%i", myOptionsEnum); // Prints 4

// ******************** END Table 7-8

// ******************** BEGIN Table 7-11

@property (copy, nonatomic) NSString *title;
// In HttpStatusChecker.h
@import Foundation;
@interface HttpStatusChecker : NSObject
+ (instancetype)checkerWithHttpStatus:(NSArray *)httpStatus;
- (NSArray *)status;
- (void)setStatus:(NSArray *)httpStatus;
@end
// In HttpStatusChecker.m
#import "HttpStatusChecker.h"
@interface HttpStatusChecker ()
@property (assign, nonatomic) NSInteger code;
@property (copy, nonatomic) NSString *message;
@end
@implementation HttpStatusChecker
+ (instancetype)checkerWithHttpStatus:(NSArray *)httpStatus
{
  HttpStatusChecker *status = [HttpStatusChecker new];
  [status setStatus:httpStatus];
  return status;
}
- (instancetype)init
{
  if (self = [super init]) {
    _code = 200;
    _message = @"OK";
  }
  return self;
}
- (NSArray *)status
{
  return @[@(self.code), self.message];
}
- (void)setStatus:(NSArray *)httpStatus
{
  self.code = [(NSNumber *)httpStatus[0] integerValue];
  self.message = httpStatus[1];
}
@end
// In –[SomeOtherClass someMethod] in SomeOtherClass.m
HttpStatusChecker *httpStatusChecker = [HttpStatusChecker checkerWithHttpStatus:@[@200, @"OK"]];
NSLog(@"code: %@, status: %@", httpStatusChecker.status[0], httpStatusChecker.status[1]); // Prints "code: 200, status: OK"
static NSString *defaultTitle = @"A Worthy Title";
// In DateChecker.h
@import Foundation;
@interface DateChecker : NSObject
+ (NSString *)dateString;
@end
// In DateChecker.m
#import "DateChecker.h"
@implementation DateChecker
+ (NSString *)dateString
{
  return [NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}
@end
// In –[SomeOtherClass someMethod] in SomeOtherClass.m
NSLog(@"%@", [DateChecker dateString]); // Prints current date, e.g., "9/14/14"
// In TitleTracker.h
@import Foundation;
@interface TitleTracker : NSObject
@property (copy, nonatomic) NSString *title;
@property (assign, nonatomic) BOOL isBeingInstantiated;
+ (instancetype)trackerWithTitle:(NSString *)title;
@end
// In TitleTracker.m
#import "TitleTracker.h"
@interface TitleTracker ()
@property (copy, nonatomic) NSString *oldTitle;
@end
@implementation TitleTracker
+ (instancetype)trackerWithTitle:(NSString *)title
{
  TitleTracker *tracker = [TitleTracker new];
  tracker.isBeingInstantiated = YES;
  tracker.title = title;
  tracker.isBeingInstantiated = NO;
  return tracker;
}
- (void)setTitle:(NSString *)title
{
  if (!self.isBeingInstantiated) {
    const char* oldTitle = [self.oldTitle UTF8String];
    printf("'%s' (fka '%s'). Farewell to '%s.'\n", [title UTF8String], oldTitle, oldTitle);
    _title = title;
  }
  self.oldTitle = title;
}
@end
// In –[SomeOtherClass someMethod] in SomeOtherClass.m
TitleTracker *myTitleTracker = [TitleTracker trackerWithTitle:@"A Worthy Title"];
myTitleTracker.title = @"A Better Title"; // Prints "'A Better Title' (fka 'A Worthy Title'). Farewell to 'A Worthy Title.'"

// ******************** END Table 7-11

// ******************** BEGIN Table 7-12

Objective-C
// In SalutationPrinter.h
@import Foundation;
@interface SalutationPrinter : NSObject
+ (void)print:(NSString *)salutation toRecipient:(NSString *)recipient;
- (void)print:(NSString *)salutation toRecipient:(NSString *)recipient;
@end
// In SalutationPrinter.m
#import "SalutationPrinter.h"
@implementation SalutationPrinter
+ (void)print:(NSString *)salutation toRecipient:(NSString *)recipient
{
  NSLog(@"%@ %@", salutation, recipient);
}
- (void)print:(NSString *)salutation toRecipient:(NSString *)recipient
{
  NSLog(@"%@ %@", salutation, recipient);
}
@end
SalutationPrinter *salutationPrinter = [SalutationPrinter new];
[salutationPrinter print:@"Hello" toRecipient:@"Henry"]; // Prints "Hello Henry"
[SalutationPrinter print:@"Hello" toRecipient:@"Henry"]; // Prints "Hello Henry"
N/A

// ******************** END Table 7-12

// In SomeOtherClass.m
#import "Transitioning-Swift.h"
@implementation SomeOtherClass
- (void)someMethod
{
  MySwiftCustomClass *swiftClassInstance = [[MySwiftCustomClass alloc] initWithEnabled:NO];
}

// ******************** BEGIN Table 7-13

// In KeyboardDisplayHandler.h
@import UIKit;
@interface KeyboardDisplayHandler : NSObject
@end
// In KeyboardDisplayHandler.m
#import "KeyboardDisplayHandler.h"
@implementation KeyboardDisplayHandler
- (instancetype)init
{
  if (self = [super init]) {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(keyboardWillShow) name:UIKeyboardWillShowNotification object:nil];
    [notificationCenter addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
  }
  return self;
}
- (void)keyboardWillShow
{
  // ...
}
- (void)keyboardWillHide
{
  // ...
}
@end

// ******************** END Table 7-13

// ******************** BEGIN Table 7-14

// In MyCustomClass.h
@import Foundation;
@class ParkingSpaceAssignment;
@interface Employee : NSObject
@property (strong, nonatomic) ParkingSpaceAssignment *parkingSpaceAssignment;
@end
@interface ParkingSpace : NSObject
@property (assign, nonatomic) NSUInteger number;
@property (weak, nonatomic) ParkingSpaceAssignment *assignment;
- (instancetype)initWithNumber:(NSUInteger)number;
@end
@interface ParkingSpaceAssignment : NSObject
@property (weak, nonatomic) ParkingSpace *parkingSpace;
@property (weak, nonatomic) Employee *employee;
- (instancetype)initWithParkingSpace:(ParkingSpace *)parkingSpace employee:(Employee *)employee;
@end
// In MyCustomClass.m
#import "MyCustomClass.h"
@implementation Employee
- (void)dealloc
{
  NSLog(@"Fired!");
}
@end
@implementation ParkingSpace
- (instancetype)initWithNumber:(NSUInteger)number
{
  if (self = [super init]) {
    _number = number;
  }
  return self;
}
- (void)dealloc
{
  NSLog(@"Parking space deleted");
}
@end
@implementation ParkingSpaceAssignment
- (instancetype)initWithParkingSpace:(ParkingSpace *)parkingSpace employee:(Employee *)employee
{
  if (self = [super init]) {
    _parkingSpace = parkingSpace;
    _employee = employee;
  }
  return self;
}
- (void)dealloc
{
  NSLog(@"Assignment deleted");
}
@end
// In –[SomeOtherClass someMethod] in SomeOtherClass.m
Employee *chris = [Employee new];
ParkingSpace *parkingSpace = [[ParkingSpace alloc] initWithNumber:8];
chris.parkingSpaceAssignment = [[ParkingSpaceAssignment alloc] initWithParkingSpace:parkingSpace employee:chris];
chris = nil;
/* Prints:
 Fired!
 Assignment deleted
 */

// ******************** END Table 7-14

// ******************** BEGIN Table 7-15

// In MyCustomClass.h
@import Foundation;
@interface Bravo : NSObject
@property (copy, nonatomic) NSString *value;
- (instancetype)initWithValue:(NSString *)value;
@end
@interface Charlie : NSObject
@property (copy, nonatomic) NSString *value;
- (instancetype)initWithValue:(NSString *)value;
@end
typedef void (^Printer)();
@interface Alpha : NSObject
@property (copy, nonatomic) NSString *value;
@property (strong, nonatomic) Bravo *bravo;
@property (strong, nonatomic) Charlie *charlie;
@property (copy, nonatomic) Printer printOutValues;
- (instancetype)initWithValue:(NSString *)value bravoValue:(NSString *)bravoValue charlieValue:(NSString *)charlieValue;
@end
// In MyCustomClass.m
#import "MyCustomClass.h"
@implementation Bravo
- (instancetype)initWithValue:(NSString *)value
{
  if (self = [super init]) {
    _value = value;
  }
  return self;
}
- (void)dealloc
{
  NSLog(@"Bravo deallocated");
}
@end
@implementation Charlie
- (instancetype)initWithValue:(NSString *)value
{
  if (self = [super init]) {
    _value = value;
  }
  return self;
}
- (void)dealloc
{
  NSLog(@"Charlie deallocated");
}
@end
@implementation Alpha
- (instancetype)initWithValue:(NSString *)value bravoValue:(NSString *)bravoValue charlieValue:(NSString *)charlieValue
{
  if (self = [super init]) {
    _value = value;
    _bravo = [[Bravo alloc] initWithValue:bravoValue];
    _charlie = [[Charlie alloc] initWithValue:charlieValue];
    __weak typeof(self)weakSelf = self;
    _printOutValues = ^{
      if (weakSelf.value.length && weakSelf.bravo.value.length && weakSelf.charlie.value.length) {
        NSLog(@"%@ %@ %@", weakSelf.value, weakSelf.bravo.value, weakSelf.charlie.value);
      }
    };
  }
  return self;
}
- (void)dealloc
{
  NSLog(@"Alpha deallocated");
}
@end
// In –[SomeOtherClass someMethod] in SomeOtherClass.m
Alpha *alpha = [[Alpha alloc] initWithValue:@"Alpha" bravoValue:@"Bravo" charlieValue:@"Charlie"];
alpha.printOutValues(); // Prints "Alpha Bravo Charlie"
alpha.bravo = nil; // Prints "Bravo deallocated"
alpha.charlie = nil; // Prints "Charlie deallocated"
alpha = nil; // Prints "Alpha deallocated"

// ******************** END Table 7-15

// ******************** BEGIN Table 7-16

// In StoreManager.h
@import Foundation;
@interface StoreManager : NSObject
+ (instancetype)sharedManager;
@end
// In StoreManager.m
#import "StoreManager.h"
@implementation StoreManager
+ (instancetype)sharedManager
{
  static StoreManager *sharedManager = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedManager = [StoreManager new];
  });
  return sharedManager;
}
@end
// In –[SomeOtherClass someMethod] in SomeOtherClass.m
StoreManager *sharedStoreManager1 = [StoreManager sharedManager];
StoreManager *sharedStoreManager2 = [StoreManager sharedManager];
NSLog(@"%@", sharedStoreManager1 == sharedStoreManager2 ? @"YES" : @"NO"); // Prints "YES"

// ******************** END Table 7-16
