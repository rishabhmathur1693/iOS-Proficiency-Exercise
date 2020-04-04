//
//  Constants.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 02/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import Foundation

struct Constants {
  static let apiURL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
  static let activityIndicatorViewTag = 100
  static let viewLockTag = 101
  static let loadingImageViewTag = 102
  static let emptyTableMessageLabelTag = 103
}

protocol ReuseIdentifying {
  static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
  static var reuseIdentifier: String {
    return String(describing: Self.self)
  }
}
