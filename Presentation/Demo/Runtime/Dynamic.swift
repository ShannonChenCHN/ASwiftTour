//
//  Dynamic.swift
//  Runtime
//
//  Created by ShannonChen on 2019/7/15.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


class ParentClass {
    dynamic func method1() {}
    dynamic func method2() {}
}
class ChildClass: ParentClass {
    override func method2() {}
    dynamic func method3() {}
    
    
}
