//
//  Fraction.m
//  FractionCalculator
//
//  Created by Kevin Jorgensen on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Fraction.h"


int GCD(int a, int b)
{
    int tmp;
    while ( a != 0 )
    {
        tmp = a;
        a = b % a;
        b = tmp;
    }
    return b;
}

@implementation Fraction

- (id) initWithNumerator: (int) numer andDenominator: (int) denom
{
    self = [super init];
    
    if (self)
    {
        numerator = numer;
        denominator = denom;
    }
    
    return self;
}
- (NSString*) description
{
    return [NSString stringWithFormat: @"%d/%d", numerator, denominator];
}
- (int) numerator
{
    return numerator;
}


- (int) denominator
{
    return denominator;
}


- (Fraction *) add: (Fraction*) otherFraction
{
    int otherNumer = [otherFraction numerator];
    int otherDenom = [otherFraction denominator];
    int resultNumer = self.numerator * otherDenom + otherNumer*self.denominator;
    int resultDenom = otherDenom*self.denominator;
    
    
    Fraction *result = [[Fraction alloc] initWithNumerator:resultNumer andDenominator:resultDenom];
    [result reduce];
    
    
    return result;
}
- (Fraction *) subtract:(Fraction *)otherFraction
{
    int otherNumer = [otherFraction numerator];
    int otherDenom = [otherFraction denominator];
    int resultNumer = self.numerator * otherDenom - otherNumer*self.denominator;
    int resultDenom = otherDenom*self.denominator;
    
    
    Fraction *result = [[Fraction alloc] initWithNumerator:resultNumer andDenominator:resultDenom];
    [result reduce];
    
    
    return result;
}
- (Fraction *) multiply:(Fraction *)otherFraction
{
    int otherNumer = [otherFraction numerator];
    int otherDenom = [otherFraction denominator];
    int resultNumer = self.numerator* otherNumer;
    int resultDenom = otherDenom*self.denominator;
    
    
    Fraction *result = [[Fraction alloc] initWithNumerator:resultNumer andDenominator:resultDenom];
    [result reduce];
    
    
    return result;
}
- (Fraction *) divide:(Fraction *)otherFraction
{
    int otherNumer = [otherFraction numerator];
    int otherDenom = [otherFraction denominator];
    int resultNumer = self.numerator * otherDenom;
    int resultDenom = otherNumer*self.denominator;
    
    
    Fraction *result = [[Fraction alloc] initWithNumerator:resultNumer andDenominator:resultDenom];
    [result reduce];
    
    
    return result;
    
}

-(void) reduce
{
    int gcd = GCD(numerator,denominator);
    numerator /= gcd;
    denominator /= gcd;
}

-(Fraction *) invert
{
    Fraction *result = [[Fraction alloc] initWithNumerator:denominator andDenominator:numerator];
    [result reduce];
    return result;
    
}

@end