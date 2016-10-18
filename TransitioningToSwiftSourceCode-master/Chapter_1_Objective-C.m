//  Source Code for Transitioning to Swift, Chapter 1
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

// ******************** BEGIN Table 1-1

NSLog(@"Hello world");
NSString *helloWorld = @"Hello world";
NSLog(@"%@", helloWorld);
NSLog(@"numberOfObjects: %lu", (unsigned long)sectionInfo.numberOfObjects);

// ******************** END Table 1-1

// ******************** BEGIN Table 1-2

// In MyObjCFile.m
NSLog(@"%s", __FILE__); // Prints ".../MyObjCFile.m"
NSLog(@"%d", __LINE__); // Prints line number
N/A
// In SomeClass.m
- (void)someMethod
{
  NSLog(@"%s", __func__);
}
- (void)someOtherMethod
{
  [self someMethod]; // Prints "-[SomeClass someMethod]"
}

// ******************** END Table 1-2

// ******************** BEGIN Table 1-3

// Single line comment
/*
 This is a multiline
 comment
 */
/*
This is a multiline...
// SINGLE LINE COMMENT
...comment
*/
N/A
#pragma // Creates a line separator in the jump bar
#pragma mark - This is a mark preceeded by a separator
// TODO: Do this
// FIXME: Fix this

// ******************** END Table 1-3
