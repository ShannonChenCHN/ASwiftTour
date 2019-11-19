//
//  main.swift
//  Intro02
//
//  Created by xianglongchen on 2019/11/13.
//  Copyright © 2019 ctrip. All rights reserved.
//

import Foundation

var settings = ["swift": true, "latestVersion": true]
// 1
@propertyWrapper
struct SettingsWrapper {
  let key: String
  let defaultValue: Bool

  // 2
  var wrappedValue: Bool {
    get {
      settings[key] ?? defaultValue
    }
    set {
      settings[key] = newValue
    }
  }
}

// 3
struct Settings {
  @SettingsWrapper(key: "swift", defaultValue: false) var isSwift: Bool
  @SettingsWrapper(key: "latestVersion", defaultValue: false) var isLatestVersion: Bool
}



var newSettings = Settings()
print(newSettings.isSwift)
print(newSettings.isLatestVersion)
newSettings.isSwift = false
newSettings.isLatestVersion = false
print(newSettings.isSwift)
print(newSettings.isLatestVersion)
