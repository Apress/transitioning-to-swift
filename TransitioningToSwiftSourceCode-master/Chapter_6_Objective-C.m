//  Source Code for Transitioning to Swift, Chapter 6
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

// ******************** BEGIN Table 6-3

- (void)printTime
{
  NSString *timestamp = [NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterShortStyle];
  NSLog(@"%@", timestamp);
}
[self printTime]; // Prints current timestamp, e.g., "Sep 9, 2014, 4:30 AM"
- (void)printUnicodeNameForCharacter:(NSString *)character
{
  CFMutableStringRef cfMutableString = (__bridge CFMutableStringRef)([NSMutableString stringWithFormat:@"%@", character]);
  CFRange range = CFRangeMake(0, CFStringGetLength(cfMutableString));
  CFStringTransform(cfMutableString, &range, kCFStringTransformToUnicodeName, 0);
  NSString *cString = [NSString stringWithFormat:@"%@", cfMutableString];
  NSString *unicodeName = [cString substringWithRange:NSMakeRange(3, cString.length - 4)];
  NSLog(@"%@", unicodeName.capitalizedString);
}
[self printUnicodeNameForCharacter:@"☤"]; // Prints "Caduceus"
@interface MyClass : NSObject
@end
@implementation MyClass
@end
@interface MySubClass : MyClass
@end
@implementation MySubClass
@end
- (void)doSomethingWithMyClass:(MyClass *)myClass
{
  // ...
}
[self doSomethingWithMyClass:[MySubClass new]];
- (void)concatenateArrayOfStrings:(NSArray *)strings withSeparator:(NSString *)separator
{
  separator = separator ?: @", ";
  __block NSMutableString *string = [@"" mutableCopy];
  [strings enumerateObjectsUsingBlock:^(NSString *s, NSUInteger idx, BOOL *stop) {
    if (idx == 0) {
      [string appendFormat:@"%@", s];
    } else if (idx < [strings count] - 1) {
      [string appendFormat:@"%@%@", separator, s];
    } else {
      [string appendFormat:@", and %@", s];
    }
  }];
  NSLog(@"%@", string);
}
[self concatenateArrayOfStrings:@[@"Scott", @"Lori", @"Charlotte", @"Betty", @"Gracie", @"Sophie", @"Stella", @"Isabella", @"Lilith", @"Darby"] withSeparator:nil]; // Prints "Scott, Lori, Charlotte, Betty, Gracie, Sophie, Stella, Isabella, Lilith, and Darby"
@import AVFoundation;
- (void)sayGreeting:(NSString *)greeting toName:(NSString *)name
{
  AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:[NSString stringWithFormat:@"%@ %@", greeting ?: @"Hello", name ?: @"world"]];
  AVSpeechSynthesizer *synthesizer = [AVSpeechSynthesizer new];
  [synthesizer speakUtterance:utterance];
}
[self sayGreeting:@"Hi" toName:@"Scott"]; // Speaks "Hi Scott" (works on device only)
- (void)printHtmlTR:(NSString *)tdValue, ...
{
  NSMutableString *tr = [@"<tr>" mutableCopy];
  va_list tdValues;
  va_start(tdValues, tdValue);
  for (; tdValue; tdValue = va_arg(tdValues, NSString *)) {
    [tr appendFormat:@"<td>%@</td>", tdValue];
  }
  va_end(tdValues);
  [tr appendString:@"</tr>"];
  NSLog(@"%@", tr);
}
[self printHtmlTR:@"5 bananas", @"@ $1 each", @"= $5", nil]; // Print "<tr><td>5 bananas</td><td>@ $1 each</td><td>= $5</td></tr>"
- (int)square:(int)integer
{
  return integer * integer;
}
int squareOf5 = [self square:5]; // Prints "25"

// ******************** END Table 6-3

// ******************** BEGIN Table 6-7

NSMutableArray *array = [@[@"Scott", @"Lori", @"Charlotte", @"Betty", @"Gracie", @"Sophie", @"Stella", @"Isabella", @"Lilith", @"Darby"] mutableCopy];
[array sortUsingComparator:^NSComparisonResult(NSString *string1, NSString *string2) {
  return [string1 compare:string2];
}];

NSLog(@"%@", array); // Prints "(Betty, Charlotte, Darby, Gracie, Isabella, Lilith, Lori, Scott, Sophie, Stella)"

// ******************** END Table 6-7
