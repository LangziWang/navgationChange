//
//  UINavigationController+StatusBarStyle.m
//  navgationChangeAlpha
//
//  Created by Secret Wang on 2016/10/14.
//  Copyright © 2016年 Secret. All rights reserved.
//

#import "UINavigationController+StatusBarStyle.h"

@implementation UINavigationController (StatusBarStyle)

-(UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

-(UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}

@end
