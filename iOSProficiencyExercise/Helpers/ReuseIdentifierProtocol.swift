//
//  ReuseIdentifyProtocol.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 05/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import Foundation

/// Protocol to get reuse identifier name
protocol ReuseIdentifierProtocol {
  
  static var reuseIdentifier: String { get }
}

extension ReuseIdentifierProtocol {
  
  /// Default implementation of ReuseIdentifierProtocol
  static var reuseIdentifier: String {
    return String(describing: Self.self)
  }
}
