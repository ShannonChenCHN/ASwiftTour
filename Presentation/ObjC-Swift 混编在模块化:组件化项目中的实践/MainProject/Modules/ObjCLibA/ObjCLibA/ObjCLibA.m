//
//  ObjCLibA.m
//  ObjCLibA
//
//  Created by ShannonChen on 2020/3/28.
//  Copyright © 2020 ShannonChen. All rights reserved.
//

#import "ObjCLibA.h"
#import "SwiftLibA-Swift.h"

@implementation ObjCLibA

- (void)sayHello {
    [[SwiftLibA new] sayHelloWithName:@"ObjCLibA"];
}

@end
