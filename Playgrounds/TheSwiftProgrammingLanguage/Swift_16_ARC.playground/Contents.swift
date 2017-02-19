//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////  ARC //////////////////////////////

// ======================== ARC in Action =====================

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    var apartment: Apartment?  // The apartment property is optional, because a person may not always have an apartment.
    
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}

class Apartment {
    let unit: String
    
    init(unit: String) {
        self.unit = unit
    }
    
    var tenant: Person?  // The tenant property is optional because an apartment may not always have a tenant.
    
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}


// Because these variables are of an optional type (Person?, not Person), they are automatically initialized with a value of nil, and do not currently reference a Person instance
var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed") // 1st strong reference
reference2 = reference1   // 2nd strong reference
reference3 = reference1   // 3rd strong reference

reference1 = nil   // break the 1st strong reference
reference2 = nil   // break the 2st strong reference



// ARC does not deallocate the Person instance until the third and final strong reference is broken, at which point it’s clear that you are no longer using the Person instance
reference3 = nil


// =============== Strong Reference Cycles Between Class Instances ===================

var john: Person?
var unit4A: Apartment?

john = Person.init(name: "Jhon Appleseed") // The john variable now has a strong reference to the new Person instance
unit4A = Apartment.init(unit: "4A")  // The unit4A variable has a strong reference to the new Apartment instance

john!.apartment = unit4A  // The Person instance now has a strong reference to the Apartment instance
unit4A!.tenant = john  // The Apartment instance has a strong reference to the Person instance


// Neither deinitializer was called when we set these two variables to nil
// The strong reference cycle prevents the Person and Apartment instances from ever being deallocated, causing a memory leak in our app.
john = nil
unit4A = nil



// =========== Resolving Strong Reference Cycles Between Class Instances ============

/* Weak Reference */


/*
 
class Apartment {
    let unit: String
 
    init(unit: String) {
        self.unit = unit
    }
 
 weak var tenant: Person? // Use a weak reference when the other instance has a `shorter` lifetime—that is, when the other instance can be deallocated first
    
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}
*/




/* Unowned Reference */

class Customer {
    var name: String
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer // An unowned reference is used when the other instance has the same lifetime or a longer lifetime. Customer property cannot be nil
    
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("Card #\(number) is being deinitialized")
    }
    
}

var jason: Customer?
jason = Customer(name: "Jason Kidd")
jason!.card = CreditCard.init(number: 1234_5678_9012_3456, customer: jason!)

jason = nil


/* Unowned References and Implicitly Unwrapped Optional Properties */

class Country {
    let name: String
    var capitalCity: City! // an implicitly unwrapped optional property, this means that the capitalCity property has a default value of nil
    
    init(name: String, capitalName: String) {
        
        // Because capitalCity has a default nil value, a new Country instance is considered fully initialized as soon as the Country instance sets its name property within its initializer
        self.name = name
        
        // Initializer can start to reference and pass around the implicit self property as soon as the name property is set
        self.capitalCity = City.init(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}


var country = Country.init(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name))")



// =================== Strong Reference Cycles for Closures ====================
// =============== Resolving Strong Reference Cycles for Closures ================
class HTMLDelegate {
    
}


class HTMLElement {
    
    let name: String
    let text: String?
    let delegate: HTMLDelegate?
    
    // A `() -> String` type closure
    lazy var asHTML: () -> String = {
        [unowned self] in
        
        // Swift requires us to write `self.text` rather than just `text` whenever we refer to a member of self within a closure.
        if let text = self.text {
            
            return "<\(self.name)>\(text)</\(self.name)>"
            
        } else {
            
            return "<\(self.name) />"
            
        }
    }
    
    // Defining a Capture List
    lazy var someClosure: (Int, String) -> String = {
        [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
        
        // closure body goes here
        return "\(index)" + stringToProcess
    }
    
    // Defineing a Capture List in another way
    lazy var anotherClosure: () -> String = {
        [unowned self, weak delegate = self.delegate!] in
        
        // closure body goes here
        return "There is nothing to return"
    }
    
    
    
    // an initializer with default paramter `text` = nil
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
        self.delegate = nil
        print("called initializer")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}


let heading = HTMLElement.init(name: "h1")
let defaultText = "some default text"

heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}

print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement.init(name: "p", text: "hello, world")
print(paragraph!.asHTML())

// Because there is a strong reference cycle between the instance paragraph refers to and instance's asHTML closure
paragraph = nil







