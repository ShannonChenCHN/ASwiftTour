//
//  MethodDynamicDispatch.swift
//  Protocols
//
//  Created by ShannonChen on 2019/9/1.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

// https://mikeash.com/pyblog/friday-qa-2015-06-19-the-best-of-whats-new-in-swift.html

import Foundation




protocol P {
    func a()
}

extension P {
//    func a() {
//        
//    }
}

protocol P2 {
    func a()
}

extension P2 {
    func a() {
        
    }
}

//extension P {
//    func a() {
//        print("协议 P 的扩展，方法 A")
//    }
//
//    // 如果只在 Protocol extension 中定义了这个方法，但是没有在 Protocol
//    // 中声明的话，那么实体类型在重写这个方法时就会变成静态派发而不是动态派发了
//    // http://lijun.xyz/2017/02/12/Protocol-Extension/
//    func b() {
//        print("协议 P 的扩展，方法 B")
//    }
//}

class S: P, P2 {
//    func a() {
//
//        // 调用super？？
//        print("结构体 S 中的 A 方法实现")
//    }
    
    func b() {
        print("结构体 S 中的 B 方法实现")
    }
}


func runExample18() {
//    let p: P = S()
    let p = S()
    p.a()
    p.b()
}
