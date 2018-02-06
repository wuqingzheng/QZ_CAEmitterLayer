//
//  CloudEmitterLayer.h
//  QZ_CAEmitterLayer
//
//  Created by 吴清正 on 2018/2/5.
//  Copyright © 2018年 dazheng_wu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, CLOUD_TYPE) {
    CLOUD_LITTER_DAY_TYPE,         //白天少云
    CLOUD_MUCH_NIGHT_TYPE,         //夜间多云
    CLOUD_LITTER_NIGHT_TYPE,       //夜间少云
    CLOUD_MUCH_DAY_TYPE,           //白天多云
};
@interface CloudEmitterLayer : CAEmitterLayer

+ (instancetype)instanceWithFrame:(CGRect)rect cloudType:(CLOUD_TYPE)cloudType;
@end
