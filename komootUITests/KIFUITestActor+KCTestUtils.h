//
//  KIFUITestActor+KCTestUtils.h
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/12/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import "KIFUITestActor.h"

@interface KIFUITestActor (KCTestUtils)

- (UIBarButtonItem *)tryFindingRightBarButtonItem;
- (UIBarButtonItem *)tryFindingLeftBarButtonItem;

- (void)tapBackButton;

@end
