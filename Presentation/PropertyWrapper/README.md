#  Property Wrapper



### 四种使用场景：
- Constraining Values
- Transforming Values on Property Assignment
- Changing Synthesized Equality and Comparison Semantics
- Auditing Property Access

### 缺点
- Properties Can’t Participate in Error Handling
- Wrapped Properties Can’t Be Aliased
- Property Wrappers Are Difficult To Compose
- Property Wrappers Aren’t First-Class Dependent Types
- Property Wrappers Are Difficult to Document
- Property Wrappers Further Complicate Swift

### 参考：
https://nshipster.com/propertywrapper/
https://github.com/apple/swift-evolution/blob/master/proposals/0258-property-wrappers.md
https://medium.com/genetec-tech/property-wrappers-in-swift-5-1-the-missing-published-implementation-1a466ebcf660
