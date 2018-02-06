//
//  RainEmitterLayer.h
//  QZ_CAEmitterLayer
//
//  Created by 吴清正 on 2018/2/5.
//  Copyright © 2018年 dazheng_wu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RAIN_TYPE) {
    RAIN_THUNDERSHOWER_TYPE,   //雷阵雨
    RAIN_SHOWER_TYPE,          //阵雨
    RAIN_LITTER_TYPE,          //小雨
    RAIN_MIDDLE_TYPE,          //中雨
    RAIN_HEAVY_TYPE,           //大雨
};
@interface RainEmitterLayer : CAEmitterLayer

+ (instancetype)instanceWithFrame:(CGRect)rect rainType:(RAIN_TYPE)rainType;
@end
