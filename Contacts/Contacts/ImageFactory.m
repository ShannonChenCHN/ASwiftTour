//
//  ImageFactory.m
//  Contacts
//
//  Created by ShannonChen on 2017/1/28.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "ImageFactory.h"

@implementation ImageFactory

+ (UIImage *)generateDefaultImageOfSize:(CGSize)size {
    // Make frame and get conext
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    
    // Begin drawing
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Draw white background and yellow circle
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, frame);
    CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextFillEllipseInRect(context, frame);
    
    CGFloat centerX = frame.size.width * 0.5;
    CGFloat centerY = frame.size.height * 0.5;
    
    // Draw eyes
    CGSize eyeSize = CGSizeMake(frame.size.width * 0.1, frame.size.height * 0.1);
    CGFloat sepration = frame.size.width * 0.1;
    
    CGPoint leftPt = CGPointMake(centerX - (sepration + eyeSize.width), centerY - (eyeSize.height * 2));
    CGPoint rightPt = CGPointMake(centerX + (sepration + eyeSize.width), centerY - (eyeSize.height * 2));
    
    CGRect leftEyeFrame = CGRectMake(leftPt.x, leftPt.y, eyeSize.width, eyeSize.height);
    CGRect rightEyeFrame = CGRectMake(rightPt.x, rightPt.y, eyeSize.width, eyeSize.height);
    
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextFillEllipseInRect(context, leftEyeFrame);
    CGContextFillEllipseInRect(context, rightEyeFrame);
    
    // Draw smile
    CGFloat smileHeight = centerY + eyeSize.height;
    CGPoint leftEdge = CGPointMake(leftEyeFrame.origin.x, smileHeight);
    CGPoint rightEdge = CGPointMake(rightEyeFrame.origin.x + rightEyeFrame.size.width, smileHeight);
    CGFloat smileLength = rightEdge.x - leftEdge.x;
    CGFloat smileWidth = eyeSize.width / 3;
    
    CGContextSetLineWidth(context, smileWidth);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, leftEdge.x, leftEdge.y);
    CGContextAddCurveToPoint(context, leftEdge.x + smileLength / 4, smileHeight + smileWidth * 2, rightEdge.x - smileLength / 4, smileHeight + smileWidth * 2, rightEdge.x, rightEdge.y);
    
    CGContextStrokePath(context);
    
    // End drawing
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
