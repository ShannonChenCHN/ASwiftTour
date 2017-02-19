//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////  Error Handling //////////////////////////////

// ========= Representing and Throwing Errors =================

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

// ======================== Handling Errors =====================


/* 1. Propagating Errors Using Throwing Functions */

// a function can throw an error
func canThrowErrors() throws {
    
}

// a function cannot throw an error
func cannotThrowErrors() {
    
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item.init(price: 12, count: 7),
        "Chips": Item.init(price: 10, count: 4),
        "Pretzels": Item.init(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        
        print("Dispensing \(name)")
    }
    
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

// Because this is a throwing function, any errors that the `vend(itemNamed:)` method throws will propagate up to the point where this function is called
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
    
}


struct PurchasedSnack {
    let name: String
    
    // Throwing initializers can propagate errors in the same way as throwing functions.
    init(name: String, vendingMachine: VendingMachine) throws {
        
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
    
}


/* 2. Handling Errors Using Do-Catch */


var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

//  The catch clauses don’t have to handle every possible error that the code in its do clause can throw. If none of the catch clauses handle the error, the error propagates to the surrounding scope. However, the error must be handled by some surrounding scope—either by an enclosing do-catch clause that handles the error or by being inside a throwing function
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection")

} catch VendingMachineError.outOfStock {
    print("Out of Stock")
    
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}



/* 3. Converting Errors to Optional Values */

func someThrowingFunction() throws -> Int {
    // throw errors ...
    return 1
}

let x = try! someThrowingFunction()

let y: Int?

do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

func fetchData() -> Data? {
    
    // Using try? lets you write concise error handling code when you want to handle all errors in the same way
    if let data = try? fetchDataFromDisk() {
        return data
    }
    
    if let data = try? fetchDataFromServer() {
        return data
    }
    
    return nil
}

func fetchDataFromDisk() throws -> Data {
    // throw errors ...
    return Data()
}

func fetchDataFromServer() throws -> Data {
    // throw errors ...
    return Data()
}

/* 4. Disabling Error Propagation */

// ======================== Specifying Cleanup Actions =====================

struct File {
    func readline() throws -> Int? {
        return 0
    }
}

func exists(_ filename: String) -> Bool {
    return true
}

func open(_ filename: String) -> File {
    return File()
}

func close(_ file: File) {
    
}

func processFile(filename: String) throws {
    
    if exists(filename) {
        let file = open(filename)
        
        defer {
            close(file)
        }
        
        while let line = try file.readline() {
            // Work with the file.
            print("\(line)")
        }
        
        // close(file) is called here, at the end of the scope.
    }
}


