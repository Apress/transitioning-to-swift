//  Source Code for Transitioning to Swift, Chapter 5
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

// ******************** BEGIN Table 5-2

NSUInteger testScore = 100;
typedef enum : NSUInteger {
  CategoryRecklessDriving,
  CategoryExhibitionOfAcceleration
} Category;
NSUInteger speed1 = 50;
NSUInteger speed2 = 85;
NSUInteger time = 6;
Category category;
NSString *nameTextFieldText;
if (nameTextFieldText.length) {
  NSLog(@"Hello %@!", nameTextFieldText);
} else {
  NSLog(@"Welcome guest!");
}
// Prints "Welcome guest!"
switch (testScore) {
  case 100:
    printf("You aced it! ");
  case 99:
  case 98:
    printf("Great job! ");
  case YES:
    printf("Your grade: ");
  case 97:
    printf("A+\n");
    break;
  case 96:
    printf("A+\n");
    break;
  case 95:
    printf("A+\n");
    break;
    // Additional cases for 94 down to 80 (42 lines of code)...
  default:
    printf("Better study more next time.\n");
}
// Prints "You aced it! Great job! Your grade: A+"
if (speed2 > 90) {
  category = CategoryRecklessDriving;
} else if ((speed2 - speed1) / time > 4) {
  category = CategoryExhibitionOfAcceleration;
}
switch (category) {
  case CategoryRecklessDriving:
    NSLog(@"Reckless driving");
    break;
  case CategoryExhibitionOfAcceleration:
    NSLog(@"Exhibition of acceleration");
    break;
}
// Prints "Exhibition of acceleration"

// ******************** END Table 5-2

// ******************** BEGIN Table 5-3

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"Item Detail"]) {
    DetailViewController *d = (DetailViewController *)segue.destinationViewController;
    d.title = segue.identifier;
    d.itemForDetail = item;
  } else if ([segue.identifier isEqualToString:@"Related Items"]) {
    UINavigationController *nc = segue.destinationViewController;
    RelatedViewController *r = (RelatedViewController *)nc.topViewController;
    r.title = segue.identifier;
    r.category = item.category;
  }

// ******************** END Table 5-3

// ******************** BEGIN Table 5-4

- (u_int32_t)rollDie
{
  return arc4random_uniform(6) + 1;
}
int die1 = [self rollDie];
int die2 = [self rollDie];
while (die1 != 1 && die2 != 1) {
  NSLog(@"%u & %u", die1, die2);
  die1 = [self rollDie];
  die2 = [self rollDie];
}
NSLog(@"Snake eyes!");
do {
  die1 = [self rollDie];
  die2 = [self rollDie];
  NSLog(@"%u & %u", die1, die2);
} while (die1 != 1 && die2 != 1);
NSLog(@"Snake eyes!");

// ******************** END Table 5-4

// ******************** BEGIN Table 5-5

NSDictionary *numbers = @{@1: @"One", @2: @"Two", @3: @"Three"};
NSString *starring = @"STARRING";
for (int i = 1; i < 4; i++) {
  printf("%i ", i);
}
// Prints "1 2 3 "
for (int i = 10; i > 0; i -= 2) {
  printf("%i ", i);
}
// Prints "10 8 6 4 2 "
for (NSNumber *n in [numbers allKeys]) {
  if ([n isEqual:@2]) {
    continue;
  }
  NSLog(@"%@: %@", n, numbers[n]);
}
// Prints "3: Three
1: One"
for (NSNumber *i in [[@[@1, @2, @3] reverseObjectEnumerator] allObjects]) {
  printf("%i ", [i integerValue]);
}
// Prints "3 2 1 "
NSRange range = NSMakeRange(0, 1);
for (; range.location < starring.length; range.location++) {
  NSLog(@"%@", [starring substringWithRange:range]);
}
// Prints each letter of "STARRING" on a new line

// ******************** END Table 5-5

// ******************** BEGIN Table 5-6

start:
while (true) {
  int randomNumber = arc4random_uniform(100);
  switch (randomNumber) {
    case 55:
      printf(" - Finally!\n");
      goto end;
    default:
      printf("\nrandomNumber = %i", randomNumber);
      goto start;
  }
}
end:
printf("\n");

// ******************** END Table 5-6
