//
//  main.m
//  FirstCodeKata
//
//  Created by Oliver Short on 5/9/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

#import <Foundation/Foundation.h>


void fizzBuzz();
void largestPalindrome();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Sum of the multiples of 3 and 5
        fizzBuzz();
        
        // Largest palindrome product from two 3-digit numbers
        largestPalindrome();
        
    }
    return 0;
}

//Multiples of 3 and 5

//  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000.

void fizzBuzz() {
    
    int range = 1000;
    int sum = 0;
    
    for (int number = 0; number < range; number++) {
        // Is the number is a multiple of 3?
        if (number % 3 == 0) {
            sum += number;
        // Is the number is a multiple of 5
        } else if (number % 5 == 0) {
            sum += number;
        }
    }
    
    NSLog(@"The sum of multiples of 3 and 5 below 1000 is %d", sum);
    
}

//Largest Palindrome Product

//  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99. Find the largest palindrome made from the product of two 3-digit numbers.

void largestPalindrome() {

    //For loop to run through three digit numbers
    for (int k = 999*999; k > 0; k--) {
        NSString *number = [NSString stringWithFormat:@"%d", k];
        NSUInteger length = [number length];
        NSUInteger half = (length / 2);
        
        
        NSString *part1 = [number substringWithRange:NSMakeRange(0, half)];
        
        NSString *part2 = [number substringWithRange:NSMakeRange(half, half)];
        NSMutableString *reverseStringPart2 = [NSMutableString stringWithCapacity:[part2 length]];
        
        [part2 enumerateSubstringsInRange:NSMakeRange(0,[part2 length])
                                  options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                               usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                   [reverseStringPart2 appendString:substring];
                               }];
        
        if ([part1 isEqualToString:reverseStringPart2]) {
            NSLog(@"The largest palindrome of multiplicatin of two 3-digits number is:  %@", number);
            break;
        }
    }
}