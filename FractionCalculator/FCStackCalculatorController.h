//
//  FCStackCalculatorController.h
//  FractionCalculator
//
//  Created by Akhil Nambiar on 1/8/13.
//
//

#import <Foundation/Foundation.h>
#import "FCStack.h"

@interface FCStackCalculatorController : NSObject
{
    FCStack *stack;
}

- (void) respondToInput: (NSString *) input;

@end
