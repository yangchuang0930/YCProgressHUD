//
//  YCProgressHUD.m
//  PictureHouseKeeper
//
//  Created by 杨闯 on 16/8/19.
//  Copyright © 2016年 yc. All rights reserved.
//

#import "YCProgressHUD.h"


@implementation YCProgressHUD

+(instancetype)shareinstance{
    
    static YCProgressHUD *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YCProgressHUD alloc] init];
    });
    
    return instance;
    
}

+(void)show:(NSString *)msg inView:(UIView *)view mode:(YCProgressMode *)myMode{
    //如果已有弹框，先消失
    if ([YCProgressHUD shareinstance].hud != nil) {
        [[YCProgressHUD shareinstance].hud hideAnimated:YES];
        [YCProgressHUD shareinstance].hud = nil;
    }
    
    //4\4s屏幕避免键盘存在时遮挡
    if ([UIScreen mainScreen].bounds.size.height == 480) {
        [view endEditing:YES];
    }
    
    [YCProgressHUD shareinstance].hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //[YCProgressHUD shareinstance].hud.dimBackground = YES;    //是否显示透明背景
    [YCProgressHUD shareinstance].hud.color = [UIColor blackColor];
    [[YCProgressHUD shareinstance].hud setMargin:10];
    [[YCProgressHUD shareinstance].hud setRemoveFromSuperViewOnHide:YES];
    [YCProgressHUD shareinstance].hud.detailsLabel.text = msg;
    [YCProgressHUD shareinstance].hud.contentColor = [UIColor whiteColor];
    [YCProgressHUD shareinstance].hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    switch ((NSInteger)myMode) {
        case YCProgressModeOnlyText:
            [YCProgressHUD shareinstance].hud.mode = MBProgressHUDModeText;
            break;

        case YCProgressModeLoading:
            [YCProgressHUD shareinstance].hud.mode = MBProgressHUDModeIndeterminate;
            break;

        case YCProgressModeCircleLoading:
            [YCProgressHUD shareinstance].hud.mode = MBProgressHUDModeDeterminate;
            break;

        case YCProgressModeSuccess:
            [YCProgressHUD shareinstance].hud.mode = MBProgressHUDModeCustomView;
            [YCProgressHUD shareinstance].hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]];
            break;

        default:
            break;
    }
    
    
    
}
    

+(void)hide{
    if ([YCProgressHUD shareinstance].hud != nil) {
        [[YCProgressHUD shareinstance].hud hideAnimated:YES];
    }
}


+(void)showMessage:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view mode:YCProgressModeOnlyText];
    [[YCProgressHUD shareinstance].hud hideAnimated:YES afterDelay:1.0];
}


+(void)showOnlyText:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view mode:YCProgressModeOnlyText];
}

+(void)showMessage:(NSString *)msg inView:(UIView *)view afterDelayTime:(NSInteger)delay{
    [self show:msg inView:view mode:YCProgressModeOnlyText];
    [[YCProgressHUD shareinstance].hud hideAnimated:YES afterDelay:delay];
}

+(void)showSuccess:(NSString *)msg inview:(UIView *)view{
    [self show:msg inView:view mode:YCProgressModeSuccess];
    [[YCProgressHUD shareinstance].hud hideAnimated:YES afterDelay:1.0];
    
}


+(void)showProgress:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view mode:YCProgressModeLoading];
}

+(void)showMsgWithoutView:(NSString *)msg{
    UIWindow *view = [[UIApplication sharedApplication].windows lastObject];
    [self show:msg inView:view mode:YCProgressModeOnlyText];
    [[YCProgressHUD shareinstance].hud hideAnimated:YES afterDelay:1.0];
    
}

@end
