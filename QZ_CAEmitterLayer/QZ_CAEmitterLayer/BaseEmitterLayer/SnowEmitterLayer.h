//
//  SnowEmitterLayer.h
//  QZ_CAEmitterLayer
//
//  Created by 吴清正 on 2018/2/5.
//  Copyright © 2018年 dazheng_wu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, SNOW_TYPE){
    SNOW_Little_TYPE,   //小雪
    SNOW_Middle_TYPE,   //中雪
    SNOW_HEAVY_TYPE,    //大雪
    SNOW_SLEET_TYPE     //雨夹雪
};

@interface SnowEmitterLayer : CAEmitterLayer

+ (instancetype)instanceWithFrame:(CGRect)rect snowType:(SNOW_TYPE)snowType;
@end
