//
//  main.swift
//  EratosthenesSieve
//
//  Created by ShannonChen on 2019/9/8.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation

/** 埃拉托斯特尼筛选法：求不超过自然数N（N>1）的所有质数的一种算法。
 
 */

/// mutating 版本
func primes(n: Int) -> [Int] {
    var numbers = [Int](2..<n)
    for i in 0..<n-2 {
        let prime = numbers[i]
        if prime > 0 {
            for multiple in stride(from: 2 * prime-2, to: n-2, by: prime) {
                numbers[multiple] = 0
            }
        }
    }
    return numbers.filter { $0 > 0 }
}
//
//func foo() -> (a: Int, b: Int) {
//    return (5, 8)
//}
//
//let (a: Int, b: Int) = foo()


/// non-mutating 版本
func sieve(numbers: [Int]) -> [Int] {
    if numbers.isEmpty { return [] }
    let p = numbers[0]
    return [p] + sieve(numbers: numbers[1..<numbers.count].filter { $0 % p > 0 })
}


print(primes(n: 20))

let numbers = [Int](2..<20)
let result = sieve(numbers: numbers)
print(result)
