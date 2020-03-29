//
//  ViewController.m
//  LanguageInteroperability
//
//  Created by xianglongchen on 2019/11/21.
//  Copyright © 2019 ctrip. All rights reserved.
//

#import "ViewController.h"
#import <ObjcCodeCustomization-Swift.h>

@interface ViewController ()

@end

@implementation ViewController

+ (instancetype)collectionWithValues:(NSArray *)values forKeys:(NSArray<NSCopying> *)keys {
    return [ViewController new];
}

- (void)newMethod {
    [[CTHotelFile new] save];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 11, *)) {
        // Use iOS 11 APIs.
    } else {
        // Alternative code for earlier versions of iOS.
    }
}

- (void)unavailableMethod {
    
}

@end
