//
//  YJProgressHUD.h
//  PictureHouseKeeper
//
//  Created by 杨闯 on 16/8/19.
//  Copyright © 2016年 yc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>

typedef enum{
    YCProgressModeOnlyText=10,           //文字
    YCProgressModeLoading,              //加载菊花
    YCProgressModeCircleLoading,         //加载圆形
    YCProgressModeSuccess               //成功
    
}YCProgressMode;

@interface YCProgressHUD : NSObject

/*===============================   属性   ================================================*/

@property (nonatomic,strong) MBProgressHUD  *hud;


/*===============================   方法   ================================================*/

+(instancetype)shareinstance;

//显示
+(void)show:(NSString *)msg inView:(UIView *)view mode:(YCProgressMode *)myMode;

//隐藏
+(void)hide;

//只显示文字
+(void)showOnlyText:(NSString *)msg inView:(UIView *)view;

//显示进度
+(void)showProgress:(NSString *)msg inView:(UIView *)view;

//显示成功提示
+(void)showSuccess:(NSString *)msg inview:(UIView *)view;

//显示提示（1秒后消失）
+(void)showMessage:(NSString *)msg inView:(UIView *)view;

//显示提示（N秒后消失）
+(void)showMessage:(NSString *)msg inView:(UIView *)view afterDelayTime:(NSInteger)delay;

//在最上层显示
+(void)showMsgWithoutView:(NSString *)msg;


@end
