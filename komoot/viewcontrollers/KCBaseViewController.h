//
//  KCBaseViewController.h
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface KCBaseViewController : UIViewController

- (void)dismissHud;
- (void)dismissHudOnView:(UIView *)view;
- (MBProgressHUD *)showLoadingMessage:(NSString *)message;
- (MBProgressHUD *)showLoadingMessage:(NSString *)message inView:(UIView *)view;

- (MBProgressHUD *)showErrorMessage:(NSString *)errorMessage;
- (MBProgressHUD *)showErrorMessage:(NSString *)errorMessage inView:(UIView *)view;
- (MBProgressHUD *)showErrorMessage:(NSString *)errorMessage inView:(UIView *)view compeltitionBlock:(MBProgressHUDCompletionBlock)completition;

- (MBProgressHUD *)showHudWithCustomView:(UIView *)customView
                                  inView:(UIView *)view
                             withMessage:(NSString *)message
                       compeltitionBlock:(MBProgressHUDCompletionBlock)completition;

- (void)presentError:(NSError *)error inView:(UIView *)view;

@end
