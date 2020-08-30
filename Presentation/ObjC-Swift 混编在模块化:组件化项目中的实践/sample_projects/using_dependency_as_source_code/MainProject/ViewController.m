//
//  ViewController.m
//  MainProject
//
//  Created by ShannonChen on 2020/3/28.
//  Copyright © 2020 ShannonChen. All rights reserved.
//

#import "ViewController.h"
#import "ObjCLibA.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    [[ObjCLibA new] sayHello];
}


@end
