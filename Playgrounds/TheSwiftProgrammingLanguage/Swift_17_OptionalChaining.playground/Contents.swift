//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////  Optional Chaining //////////////////////////////

// ========= Optional Chaining as an Alternative to Forced Unwrapping =================
// =============== Defining Model Classes for Optional Chaining =============

class Person {
    var residence: Residence?  // Default is nil
    
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        
        set {
            rooms[i] = newValue
        }
    }
    
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address?
    
}

class Room {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        
        if let buildingNumber = buildingNumber, let street = street {
            
            return "\(buildingNumber) \(street)"
            
        } else if buildingName != nil {
            
            return buildingName
            
        } else {
            return nil
        }
    }
    
}

let john = Person()

// Forced unwrapping
//let roomCount = john.residence!.numberOfRooms  // This triggers a runtime error

john.residence = Residence()

// Optional chaining
// This tells Swift to "chain" on the optional `residence` property and to retrieve the value of `numberOfRooms` if `residence` exists
if let roomCount = john.residence?.numberOfRooms {
    
    print("John's residence has \(roomCount) rooms.")
    
} else {
    
    print("Unable to retrieve the number of rooms.")
    
}

// ================ Accessing Properties Through Optional Chaining =============


func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}


let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress // Why don't using exclamation mark(!) ? ---> Think about what if `john.residence` is nil
john.residence?.address = createAddress() // If `john.residence` is nil, the `createAddress()` is not called, because nothing is printed.



// ================== Calling Methods Through Optional Chaining ====================


// If you call this method on an optional value with optional chaining, the method’s return type will be Void?, not Void, because return values are always of an optional type when called through optional chaining. This enables you to use an if statement to check whether it was possible to call the printNumberOfRooms() method
if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}



// Any attempt to set a property through optional chaining returns a value of type Void?, which enables you to compare against nil to see if the property was set successfully
if (john.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}

// ================= Accessing Subscripts Through Optional Chaining =================

let johnHouse = Residence()
johnHouse.rooms.append(Room.init(name: "Living Room"))
johnHouse.rooms.append(Room.init(name: "BathRoom"))
johnHouse.rooms.append(Room.init(name: "Kitchen"))
john.residence = johnHouse

// You can use optional chaining to try to retrieve a value from subscript on an optional value, but you still need to make sure the index is not out of range
if let firstRoomName = john.residence?[0].name {
    
    print("The first room name is \(firstRoomName).")
    
} else {
    print("Unable to retrieve the first room name.")
}

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 90, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72

// ==================== Linking Multiple Levels of Chaining ================

if let johnStreet = john.residence?.address?.street {
    print("John's street name is \(johnStreet)")
} else {
    print("Unable to retrieve the address.")
}

let johnAddress = Address()
johnAddress.buildingName = "The Larches"
johnAddress.street = "Laurel Street"
john.residence?.address = johnAddress


if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}




// ===== Chaining on Methods with Optional Return Values =============

if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier)")
}

if let beginsWithThe = john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}
