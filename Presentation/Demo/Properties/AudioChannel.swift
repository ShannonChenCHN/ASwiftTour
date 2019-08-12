//
//  AudioChannel.swift
//  Properties
//
//  Created by ShannonChen on 2019/7/10.
//  Copyright © 2019 ShannonChen. All rights reserved.
//

import Foundation

struct AudioChannel {
    static let thresholdLevel = 10 // like `static Integer const thresholdLevel = 10` in Objective-C
    static var maxInputLevelForAllChannels = 0// like `static Integer thresholdLevel = 0` in Objective-C
    
    
    var currentLevel: Int = 0 {
        
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}


/*
 The examples that follow use two stored type properties as part
 of a structure that models an audio level meter for a number of
 audio channels. Each channel has an integer audio level between
 0 and 10 inclusive.
 
 The figure below illustrates how two of these audio channels can be combined to model a stereo audio level meter.
 
 ┏━━━━━━┳━━━━━━┓
 ┃  10  ┃  10  ┃
 ┃━━━━━━╋━━━━━━┫
 ┃   9  ┃   9  ┃
 ┃━━━━━━╋━━━━━━┫
 ┃ ...  ┃ ...  ┃
 ┃━━━━━━╋━━━━━━┫
 ┃   2  ┃   2  ┃
 ┃━━━━━━╋━━━━━━┫
 ┃   1  ┃   1  ┃
 ┗━━━━━━┻━━━━━━┛
   Left   Right
 
 */
func createAnAudioChannel() {
    var leftChannel = AudioChannel()
    var rightChannel = AudioChannel()
    leftChannel.currentLevel = 7
    print(leftChannel.currentLevel)
    print(AudioChannel.maxInputLevelForAllChannels)
    
    rightChannel.currentLevel = 11
    print(rightChannel.currentLevel)
    print(AudioChannel.maxInputLevelForAllChannels)
}


