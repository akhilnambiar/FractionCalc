//
//  FCStackCalculatorController.m
//  FractionCalculator
//
//  Created by Akhil Nambiar on 1/8/13.
//
//

#import "FCStackCalculatorController.h"
#import "FCConsole.h"
#import "Fraction.h"

@implementation FCStackCalculatorController
-(id)init
{
    if (self= [super init])
    {
        stack = [[FCStack alloc] init];
    }
        
    return self;
}

- (void) respondToInput:(NSString *)input
{
    if ([input hasPrefix: @"push"])
    {
        NSString *fractionString = [input substringFromIndex: 5];
        NSUInteger slash = [fractionString rangeOfString: @"/"].location;
        int numer = [[fractionString substringToIndex: slash] intValue];
        int denom = [[fractionString substringFromIndex: slash + 1] intValue];
        Fraction *fraction = [[Fraction alloc] initWithNumerator:numer andDenominator:denom];
        [stack push: fraction];
        [stack print];
        
    }
    if ([input hasPrefix: @"pop"])
    {
        [stack pop];
    }
    if ([input hasPrefix: @"clear"])
    {
        [stack clear];
    }
    if ([input isEqual: @"+"])
    {
        Fraction *fraction1 = [stack firstOperand];
        Fraction *fraction2 = [stack secondOperand];
        Fraction *result = [fraction1 add: fraction2];
        [stack pop];
        [stack pop];
        [stack push: result];
        [stack print];
    }
    if ([input isEqual: @"-"])
    {
        Fraction *fraction1 = [stack firstOperand];
        Fraction *fraction2 = [stack secondOperand];
        Fraction *result = [fraction1 subtract:fraction2];
        [stack pop];
        [stack pop];
        [stack push: result];
        [stack print];
    }
    if ([input isEqual: @"*"])
    {
        Fraction *fraction1 = [stack firstOperand];
        Fraction *fraction2 = [stack secondOperand];
        Fraction *result = [fraction1 multiply: fraction2];
        [stack pop];
        [stack pop];
        [stack push: result];
        [stack print];
    }
    if ([input isEqual: @"/"])
    {
        Fraction *fraction1 = [stack firstOperand];
        Fraction *fraction2 = [stack secondOperand];
        Fraction *result = [fraction1 divide: fraction2];
        [stack pop];
        [stack pop];
        [stack push: result];
        [stack print];
    }
    if ([input isEqual: @"invert"])
    {
        Fraction *fraction = [stack topOperand];
        Fraction *result = [fraction invert];
        [stack pop];
        [stack push: result];
        [stack print];
    }
    
    [FCConsole writeLine: input];
}


@end
