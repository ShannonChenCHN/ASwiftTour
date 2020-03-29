//
//  Color.m
//  LanguageInteroperability
//
//  Created by xianglongchen on 2019/11/21.
//  Copyright © 2019 ctrip. All rights reserved.
//

#import "Color.h"

Color ColorCreateWithCMYK(float c, float m, float y, float k) {
    Color color;
    color.r = c;
    color.g = m;
    color.b = y;
    color.alpha = k;
    return color;
}
 
float ColorGetHue(Color color) {
    return 1;
}


void ColorSetHue(Color color, float hue) {
    
}
 
Color ColorDarkenColor(Color color, float amount) {
    return ColorCreateWithCMYK(1, 1, 11, 1);
}
 
const Color ColorBondiBlue = {1, 1, 1, 1};
 
Color ColorGetCalibrationColor(void) {
    return ColorBondiBlue;
}

Color ColorSetCalibrationColor(Color color) {
    return ColorBondiBlue;
}
