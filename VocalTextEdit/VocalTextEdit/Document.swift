//
//  Document.swift
//  VocalTextEdit
//
//  Created by ShannonChen on 2017/1/28.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
    enum Error: Swift.Error, LocalizedError {
        case UTF8Encoding
        case UTF8Decoding
        var failureReason: String? {

            switch self {
            case .UTF8Encoding:
                return "File can not be encoded in UTF-8."
            case .UTF8Decoding:
                return "File is not valid UTF-8."
            }
        }
        
    }
    
    // MARK: Properties
    var contents: String = ""
    

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: "Document Window Controller") as! NSWindowController
        
        let viewController = windowController.contentViewController as! ViewController
        viewController.contents = contents
        
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        let windowViewController = windowControllers[0]
        let viewController = windowViewController.contentViewController as! ViewController
        
        let contents = viewController.contents ?? ""
        
        guard let data = contents.data(using: .utf8) else {
            throw Document.Error.UTF8Encoding
        }
        
        return data
        
    }

    override func read(from data: Data, ofType typeName: String) throws {
        guard let contents = String.init(data: data, encoding: .utf8) else {
            throw Document.Error.UTF8Decoding
        }
        
        // WARNING: BIG PROBLEM HERE
        self.contents = contents
        
    }


}

