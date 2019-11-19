//
//  main.swift
//  Intro01
//
//  Created by xianglongchen on 2019/11/13.
//  Copyright © 2019 ctrip. All rights reserved.
//

import Foundation

var settings = ["swift": true, "latestVersion": true]
struct Settings {
  var isSwift: Bool {
    get {
      return settings["swift"] ?? false
    }
    set {
      settings["swift"] = newValue
   }
  }

  var isLatestVersion: Bool {
    get {
      return settings["latestVersion"] ?? false
    }
    set {
      settings["latestVersion"] = newValue
    }
  }
}

var newSettings = Settings()
print(newSettings.isSwift)
print(newSettings.isLatestVersion)
newSettings.isSwift = false
newSettings.isLatestVersion = false
print(newSettings.isSwift)
print(newSettings.isLatestVersion)
