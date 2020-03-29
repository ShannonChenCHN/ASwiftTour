//
//  ViewController.h
//  LanguageInteroperability
//
//  Created by xianglongchen on 2019/11/21.
//  Copyright © 2019 ctrip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (void)newMethod API_AVAILABLE(ios(11), macosx(10.13));

+ (instancetype)collectionWithValues:(NSArray *)values forKeys:(NSArray<NSCopying> *)keys NS_SWIFT_UNAVAILABLE("Use a dictionary literal instead."); // Swift 头文件中看不到这个方法

- (void)unavailableMethod NS_UNAVAILABLE; // 调用该方法时，代码不会自动补全

@end

