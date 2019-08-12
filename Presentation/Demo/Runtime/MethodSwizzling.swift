//
//  MethodSwizzling .swift
//  Runtime
//
//  Created by ShannonChen on 2019/7/15.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation


extension NSMutableString {
    
    
    static func exchangeMethods() {
        
        // make sure this isn't a subclass
        if self !== NSMutableString.self {
            return
        }

        
        let originalSelector = #selector(getter: NSMutableString.length)
        let swizzledSelector = #selector(getter: NSMutableString.sc_length)

        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)

        if let originalMethod = originalMethod,
            let swizzledMethod = swizzledMethod  {
            let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
            
            if didAddMethod {
                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
        
    }
    
    
    @objc var sc_length: Int {
        get {
            return self.sc_length + 1
        }
    }
}


func runMethodSwizzlingExample() {
    
    
    NSMutableString.exchangeMethods()
    
    let str = NSMutableString(string: "cool")
    
    print(str.length)
    
}
