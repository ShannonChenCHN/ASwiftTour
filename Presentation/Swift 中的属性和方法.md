# Swift 中的属性和方法




哪些数据结构有 properties？类、结构体、枚举。
属性分为 Stored Properties 和 Computed Properties，枚举没有 Stored Properties。
在 Swift 中，不仅一个具体的对象实例可以有属性，类也可以具有属性。



Swifter：
- Swift 新元素
  - 柯里化
  - 属性观察
  - lazy 修饰符和 lazy 方法
- 从 Objective-C 到 Swift
  - Selector
  - 实例方法的动态调用
  - @objc 和 dynamic
  - 内存管理，weak 和 unowned
  - 值类型和引用类型
  - 获取对象类型
  - 自省
  - KVO
  - Associated Object

Swift 进阶：
- 结构体和类
  - 值类型
  - 可变性
- 函数
  - inout 参数和可变方法
  - 键路径


## 值类型和引用类型，struct 和 class 的选择

- 默认使用 struct
- 当你需要考虑到和 Objective-C 进行交互的能力时，使用 class
- Use classes when you need to control the identity of the data you're modeling.（比如说，一个类的两个实例，即便所有的属性值都一样，用 `===` 判断相等性时，还是不相等的）
- Use structures along with protocols to adopt behavior by sharing implementations.


https://developer.apple.com/documentation/swift/choosing_between_structures_and_classes

## inout 相关

Swift 中的 inout 参数并不是引用（像 C 里面的指针一样），inout 所做的事情是通过值传递，然后复制回来。


- https://docs.swift.org/swift-book/ReferenceManual/Declarations.html
- 《Swift 进阶》
  - 可变性
  - inout 参数和可变方法




## Objective-C 中的属性和实例变量

Swift 中没有像 Objective-C 那样可以直接定义和访问实例变量。

Objective-C 中的属性实际上都是 computed properties。每次通过点语法访问属性时，都被转换成了 setter/getter 的方法调用。也就是说，我们对属性的访问最终都被编译成了消息发送的机制，调用一个函数来读写实例变量。

Objective-C 的属性存在的问题，既可以用 getter 和 setter 访问，又可以直接访问实例变量：
- 对状态管理带来困难
- 在类的内部到底是直接访问示例变量还是通过属性访问，没有一致性


Swift 的设计解决了这些问题：
- stored properties 提供了 `willSet` 和 `didSet`
- computed properties 提供了 `get` 和 `set` 方法，取代了以前的 Objective-C 中 @dynamic + 重写 getter/setter 的方式

一是实现了语义上的统一，另一个就是保证了 KVC/KVO 等跟属性相关的机制的正常运作。


https://nshipster.com/swift-property-observers/

## 属性关键字

unowned, weak
lazy, class, static

## KVC 和 KVO


Swift 中也可以使用 KVO，但是仅限于 NSObject 的子类中，因为 KVO 是基于 KVC 以及动态派发技术实现的，而这些都是 Objective-C 运行时的概念。另外，由于 Swift 为了效率，默认禁用了动态派发，所以如果想要在 Swift 中实现 KVO 的话，需要将要观测的属性标记为 @objc dynamic。



https://developer.apple.com/documentation/swift/cocoa_design_patterns/using_key-value_observing_in_swift
《Swifter》
《Advanced Swift》


## runtime

https://developer.apple.com/documentation/swift/using_objective-c_runtime_features_in_swift
https://kemchenj.github.io/2016-12-25-1/
https://stackoverflow.com/questions/40795840/swift-3-dynamic-vs-objc
https://www.raywenderlich.com/5743-dynamic-features-in-swift

https://medium.com/@marcosantadev/stored-properties-in-swift-extensions-615d4c5a9a58
https://academy.realm.io/cn/posts/mobilization-roy-marmelstein-objective-c-runtime-swift-dynamic/

https://nshipster.com/swift-objc-runtime/

https://nshipster.com/swift-property-observers/


