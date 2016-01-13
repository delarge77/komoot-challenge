//
//  UIBarButtonItem+Tap.m
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/12/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import "UIBarButtonItem+Tap.h"
#import <KIF/KIF.h>

@implementation UIBarButtonItem (Tap)

- (void)tap
{
    if ([self target] && [self action]) {
        
        //Funciona mas gera um warning
        [[self target] performSelector:[self action] withObject:self];
    }
}


@end
