//
//  KIFUITestActor+KCTestUtils.m
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/12/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import "KIFUITestActor+KCTestUtils.h"
#import <KIF/KIF.h>

@implementation KIFUITestActor (KCTestUtils)

- (UIBarButtonItem *)tryFindingRightBarButtonItem
{
    UINavigationController *navigationController = (UINavigationController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
    UIBarButtonItem *rightBarButtonItem = [[[navigationController topViewController] navigationItem] rightBarButtonItem];
    
    [tester runBlock:^KIFTestStepResult(NSError **error) {
        KIFTestCondition(rightBarButtonItem != nil, error, @"Can not find rightBarButtonItem.");
        return KIFTestStepResultSuccess;
    }];
    
    return rightBarButtonItem;
}

- (UIBarButtonItem *)tryFindingLeftBarButtonItem
{
    UINavigationController *navigationController = (UINavigationController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
    UIBarButtonItem *leftBarButtonItem = [[[navigationController topViewController] navigationItem] leftBarButtonItem];
    
    [tester runBlock:^KIFTestStepResult(NSError **error) {
        KIFTestCondition(leftBarButtonItem != nil, error, @"Can not find leftBarButtonItem.");
        return KIFTestStepResultSuccess;
    }];
    
    return leftBarButtonItem;
}

- (void)tapBackButton {
    UINavigationController *navigationController = (UINavigationController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
    [navigationController popViewControllerAnimated:YES];
}


@end
