//
//  RainEmitterLayer.m
//  QZ_CAEmitterLayer
//
//  Created by 吴清正 on 2018/2/5.
//  Copyright © 2018年 dazheng_wu. All rights reserved.
//

#import "RainEmitterLayer.h"
@interface RainEmitterLayer()
@property (nonatomic, strong)CAEmitterCell *emitterCell;
@property (nonatomic, assign)NSInteger rainType;
@end
@implementation RainEmitterLayer

+ (instancetype)instanceWithFrame:(CGRect)rect rainType:(RAIN_TYPE)rainType{
    RainEmitterLayer *_emitterLayer = [RainEmitterLayer layer];
    _emitterLayer.rainType = rainType;
    _emitterLayer.position = CGPointMake(rect.origin.x + rect.size.width/2, rect.origin.y);
    _emitterLayer.emitterSize = rect.size; //粒子发射形状的大小
    _emitterLayer.emitterMode = kCAEmitterLayerSurface; //发射模式：顶点、轮廓、 表面、 容积(the default)
    _emitterLayer.emitterShape = kCAEmitterLayerLine; //发射源的形状：点(the default)、直线、矩形、立方体、圆形形、3D球
    _emitterLayer.emitterCells = @[_emitterLayer.emitterCell]; //装粒子的数组
    _emitterLayer.renderMode = kCAEmitterLayerUnordered; //渲染模式, 默认kCAEmitterLayerUnordered
    _emitterLayer.emitterPosition = CGPointMake(0, 0); //发射源的中心位置，默认(0,0,0)//决定了粒子发射形状的中心点
    _emitterLayer.emitterZPosition = 0;
    _emitterLayer.emitterDepth = 0;//决定粒子形状的深度联系

    _emitterLayer.birthRate = 5.0f; //粒子产生系数，默认1.0，即：（cell.birthRate 乘以 layer.birthRate）每秒粒子产生个数
    _emitterLayer.lifetime = 1.0f; //粒子生命周期系数，默认1.0，即：（cell.lifetime 乘以 layer.lifetime）等于粒子的生命周期
    _emitterLayer.velocity = 10.0f; //粒子速度系数, 默认1.0,即：（cell.velocity 乘以 layer.velocity）等于粒子的速度
    _emitterLayer.scale = 1.0f; //粒子的缩放比例系数, 默认1.0,即：（cell.scale 乘以 layer.scale）等于粒子的缩放比例
    _emitterLayer.spin = 1.0f; //粒子自旋转速度系数, 默认1.0,即：（cell.spin 乘以 layer.spin）等于粒子的自旋转速度
    _emitterLayer.seed = 0; //随机数发生器,默认0

    return _emitterLayer;
}

#pragma mark - get/set

- (CAEmitterCell *)emitterCell{
    if (!_emitterCell) {
        _emitterCell = [CAEmitterCell emitterCell];
        _emitterCell.contents = (id)[UIImage imageNamed:@"rainDot"].CGImage; //粒子的内容，大多都是个CGImageRef的对象,既粒子要展现的图片,默认nil
        _emitterCell.birthRate = 40.0f; //粒子的产生率，默认0
        _emitterCell.lifetime = 10.0f;  //粒子的生命周期，以秒为单位。默认0
        _emitterCell.lifetimeRange = 1.0f; //粒子生命周期的范围，以秒为单位。默认0
        _emitterCell.velocity = 50; //速度，默认0
        _emitterCell.velocityRange = 100.0f; //速度范围，默认0

        _emitterCell.xAcceleration = 0; //x,y,z方向上的加速度分量,三者默认都是0
        _emitterCell.yAcceleration = 20.0f;
        _emitterCell.zAcceleration = 0;

        _emitterCell.emissionLatitude = 0; //emissionLatitude指定了纬度,纬度角代表了x-z轴平面上与x轴之间的夹角，默认0
        _emitterCell.emissionLongitude = M_PI; //emissionLongitude指定了经度,经度角代表了x-y轴平面上与x轴之间的夹角，默认0
        _emitterCell.emissionRange = 0; //周围发射角度,默认0

        _emitterCell.scale = -0.2; //缩放比例,缩放比例范围,缩放速度,缩放比例和缩放范围默认是0
        _emitterCell.scaleRange = 0.2;
        _emitterCell.scaleSpeed = 0.05;

        _emitterCell.color = [UIColor whiteColor].CGColor; //粒子的颜色,默认白色

        //        _emitterCell.redRange = 1.f; //粒子颜色red能改变的范围,默认0
        //        _emitterCell.greenRange = 1.f; //粒子颜色green能改变的范围,默认0
        //        _emitterCell.blueRange = 1.f; //粒子颜色blue能改变的范围,默认0
        _emitterCell.alphaRange = .8f; //粒子透明度alpha能改变的范围,默认0

        //        _emitterCell.redSpeed = 0; //粒子颜色red在生命周期内的改变速度,默认0
        //        _emitterCell.greenSpeed = 0; //粒子颜色green在生命周期内的改变速度,默认0
        //        _emitterCell.blueSpeed = 0; //粒子颜色blue在生命周期内的改变速度,默认0
        _emitterCell.alphaSpeed = -.1f; //粒子透明度alpha在生命周期内的改变速度,默认0

        _emitterCell.spin = 0; //粒子自旋转角度，默认0
        _emitterCell.spinRange = 0; //粒子自旋转角度的范围,,默认0

        _emitterCell.emitterCells = nil; //the default
        _emitterCell.enabled = YES; //控制发射器发射的粒子是否渲染
        _emitterCell.style = nil; //不清楚待续..

        _emitterCell.contentsRect = CGRectMake(0, 0, 1, 1); //应该画在contents里的子rectangle,默认(0,0,1,1)
        _emitterCell.contentsScale = 1; //画在contents里的内容的比例因子

        _emitterCell.minificationFilter = @"linear"; //渲染'内容'图像时使用的滤波器参数。
        _emitterCell.magnificationFilter = @"linear"; //渲染'内容'图像时使用的滤波器参数。
        _emitterCell.minificationFilterBias = 0; //渲染'内容'图像时使用的滤波器参数。

        switch (self.rainType) {
            case RAIN_SHOWER_TYPE:
                _emitterCell.birthRate = 10.0f; //粒子的产生率，默认0
                _emitterCell.velocity = 35; //速度，默认0
                break;
            case RAIN_LITTER_TYPE:
                _emitterCell.birthRate = 25.0f; //粒子的产生率，默认0
                _emitterCell.velocity = 50; //速度，默认0
                break;
            case RAIN_MIDDLE_TYPE:
                _emitterCell.birthRate = 40.0f; //粒子的产生率，默认0
                _emitterCell.velocity = 50; //速度，默认0
                break;
            case RAIN_HEAVY_TYPE:
                _emitterCell.birthRate = 55.0f; //粒子的产生率，默认0
                _emitterCell.velocity = 50; //速度，默认0
                break;
            default:
                break;
        }
    }
    return _emitterCell;
}
@end
