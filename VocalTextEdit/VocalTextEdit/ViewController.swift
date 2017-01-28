//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by ShannonChen on 2017/1/28.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    // MARK: Properties
    let speechSythesizer = NSSpeechSynthesizer()
    var contents: String? {
        get {
            return textView.string
        }
        set {
            textView.string = newValue
        }
    }
    
    
    @IBOutlet private var textView: NSTextView!
    
    
    // Button Actions
    @IBAction func speakButtonClicked(_ sender: NSButton) {
        if let contents = textView.string, !contents.isEmpty {
            speechSythesizer.startSpeaking(contents)
        }
        else {
            speechSythesizer.startSpeaking("The documents is empty")
        }
    }
    
    @IBAction func stopButtonClicked(_ sender: NSButton) {
        speechSythesizer.stopSpeaking()
    }


}

