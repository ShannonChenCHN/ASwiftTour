# Swift 中的值类型(Building Better Apps with Value Types in Swift)
  

- Reference semantics
- Immutability
- Value semantics
- Value types in practice
- Mixing value types and reference types



### 1. Reference Semantics

- 使用引用类型时存在的问题
- 如何解决？
  - copy
  - Foundation 框架中的 NSDictionary 等类都用了 defensive copy 来保证数据安全性

### 2. Immutablity 是否是一个解决方案？

- 函数式编程
  - 使用了具有不可变性（Immutablity）的引用类型
  - 消除了很多具有可变性的引用类型带来的问题

- 函数式编程的缺陷
  - Can lead to awkward interfaces（不可变性的世界过于理想化，无论是编程语言本身，还是状态管理的编程思想，都离不开 mutating）
  - Does not map efficiently to the machine model（与机器代码的映射关系比较难处理）

- 举例子：埃拉托斯特尼筛选法
  - mutating 版本 VS non-mutating 版本

- Cocoa(Touch) 中的 Immutablity
  - Cocoa(Touch) 中的 immutable class
    - NSDate, NSURL...
    - 提高了安全性，不再需要 copy 了
  - 缺点：更低效的算法

### 3. Value Semantics


- Variables Are Logically Distinct
- Value Types Compose
  - All of Swift’s “fundamental” types are value types
    - Int, Double, String, ...
  - All of Swift’s collections are value types
    - Array, Set, Dictionary, ...
  - Swift tuples, structs, and enums that contain value types are value types
- Value Types Are Distinguished by Value


- Equatable
  - Value types should implement Equatable

- Mutation When You Want It, But not when you don’t

- Freedom from Race Conditions

- Performance: What about all those copies?
    - Copies Are Cheap: Constant time
      - Copying a low-level, fundamental type is constant time
        - Int, Double, etc
      - Copying a struct, enum, or tuple of value types is constant time
        - CGPoint, etc.
      - Extensible data structures use copy-on-write ???
        - Copying involves a fixed number of reference-counting operations
        - String, Array, Set, Dictionary, etc.


### 4. Value Types in Practice

see sample code

### 5. Mixing value types and reference types

#### 5.1 Reference Types Often Contain Value Types

Value types generally used for “primitive” data of objects:

```Swift
class Button : Control {  
  var label: String 
  var enabled: Bool 
  // ... 
}
```

#### 5.2 A Value Type Can Contain a Reference

Copies of the value type will share the reference:

```Swift
struct ButtonWrapper {  
  var button: Button 
}
```


Maintaining value semantics requires special considerations:
- How do we cope with mutation of the referenced object? 
- How does the reference identity affect equality?


#### 5.3 Immutable References and Equatable

Reference identity is not enough:

```Swift
struct Image : Drawable {
  var topLeft: CGPoint
  var image: UIImage
}

extension Image : Equatable { 
  static func ==(lhs: Image, rhs: Image) -> Bool {
    // return lhs.topLeft == rhs.topLeft && lhs.image === rhs.image
    return lhs.topLeft == rhs.topLeft && lhs.image.isEqual(rhs.image)
  }
}


var image = Image(topLeft: CGPoint(x: 0, y: 0),
                  image: UIImage(imageNamed:"San Francisco”)!)
var image2 = image
```

在上面的例子中，image 属性是不可变的引用类型，所以不用担心数据的安全性。但是判断相等性时，不能以引用值是否相等作为依据，而应该将其当做值类型一样根据内容去判断对等性。


#### 5.4 References to Mutable Objects

Unexpected mutation:

```Swift
struct BezierPath: Drawable {
  var path = UIBezierPath()
  var isEmpty: Bool {
    return path.empty
  } 
  
  func addLineToPoint(point: CGPoint) {
    path.addLineToPoint(point) // Unexpected mutation❌ 
  } 
}
```

在上面的例子中，因为 path 属性是可变的引用类型，所以在 `addLineToPoint` 方法被调用时，path 属性值可能会被改变。

#### 5.5 Copy On Write

- Unrestricted mutation of referenced objects breaks value semantics
- Separate non-mutating operations from mutating ones
  - Non-mutating operations are always safe 
  - Mutating operations must first copy


```Swift
struct BezierPath: Drawable {  
  private var _path = UIBezierPath() 
 
  var pathForReading: UIBezierPath { 
    return _path  
  } 
 
  var pathForWriting: UIBezierPath { 
    mutating get { 
      _path = _path.copy() as! UIBezierPath  return _path 
    }  
  }
     
}

extension BezierPath {  
  var isEmpty: Bool {
    return pathForReading.empty 
  } 
  
  mutating func addLineToPoint(point: CGPoint) {
    pathForWriting.addLineToPoint(point)
  }
}

var path = BezierPath()
var path2 = path
var path2 = path
if path.empty { print("Path is empty") }
var path2 = path
path.addLineToPoint(CGPoint(x: 10, y: 20))
path.addLineToPoint(CGPoint(x: 100, y: 125))
```


- Uniquely Referenced Swift Objects

The standard library value types uses this throughout:

```Swift
struct MyWrapper {
  var _object: SomeSwiftObject
  var objectForWriting: SomeSwiftObject {
    mutating get {
     if !isKnownUniquelyReferenced(&_object)) {
        _object = _object.copy()
     }
     return _object
    }
} }

```

延伸阅读：
- https://peteruncle.com/2018/03/05/swift%E4%B8%ADcopy%20on%20write%E7%9A%84%E7%A0%94%E7%A9%B6/#%E4%B8%80%E4%B8%AA%E6%AF%94%E8%BE%83%E7%B2%97%E7%B3%99%E7%9A%84copy-on-write%E5%AE%9E%E7%8E%B0
- http://swifty.wang/2017/07/05/copy-on-weite/
- https://www.hackingwithswift.com/example-code/language/how-to-safely-use-reference-types-inside-value-types-with-isknownuniquelyreferenced

#### 小结
- Maintaining value semantics requires special considerations
- Copy-on-write enables efficient value semantics when wrapping Swift reference types




### 参考
- [Building Better Apps with Value Types in Swift - WWDC 2015](https://developer.apple.com/videos/play/wwdc2015/414)
- [Protocol and Value Oriented Programming in UIKit Apps - 2016](https://developer.apple.com/videos/play/wwdc2016/419)
- [Value and Reference Types - Swift Blog - Apple Developer](https://developer.apple.com/swift/blog/?id=10)