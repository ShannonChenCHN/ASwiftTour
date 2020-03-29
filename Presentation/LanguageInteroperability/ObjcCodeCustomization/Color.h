//
//  Color.h
//  LanguageInteroperability
//
//  Created by xianglongchen on 2019/11/21.
//  Copyright © 2019 ctrip. All rights reserved.
//

#ifndef Color_h
#define Color_h

#import <Foundation/Foundation.h>

struct Color {
    float r;
    float g;
    float b;
    float alpha;
};

typedef struct Color Color;

Color ColorCreateWithCMYK(float c, float m, float y, float k) CF_SWIFT_NAME(Color.init(c:m:y:k:)); // 构造器
 
float ColorGetHue(Color color) CF_SWIFT_NAME(getter:Color.hue(self:)); // 实例属性 getter
void ColorSetHue(Color color, float hue) CF_SWIFT_NAME(setter:Color.hue(self:newValue:)); // 实例属性 setter
 
Color ColorDarkenColor(Color color, float amount) CF_SWIFT_NAME(Color.darken(self:amount:)); // 实例方法
 
extern const Color ColorBondiBlue CF_SWIFT_NAME(Color.bondiBlue); // 常量
 
Color ColorGetCalibrationColor(void) CF_SWIFT_NAME(getter:Color.calibration());  // 类属性 getter
Color ColorSetCalibrationColor(Color color) CF_SWIFT_NAME(setter:Color.calibration(newValue:));  // 类属性 setter

#endif /* Color_h */
