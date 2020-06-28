//
//  NetworkHandler.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 28/06/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import Reachability

struct NetworkHandler {

  /// Function to check for internet connectivity before performing network operations.
  /// - Returns: This function returns Bool value as per internet connection status.
  func isNetworkConnectionAvailable() -> Bool {
    guard let reachability = try? Reachability() else { return false }
    let connection = reachability.connection

    switch connection {
    case .wifi:
      print("Reachable via WiFi")
      return true
    case .cellular:
      print("Reachable via Cellular")
      return true
    case .none:
      return false
    case .unavailable:
      return false
    }
  }
}
