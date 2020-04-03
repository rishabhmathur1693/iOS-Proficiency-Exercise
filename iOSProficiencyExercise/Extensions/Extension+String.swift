//
//  Extension+String.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 03/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import Foundation

extension String {
  func convertToDictionary() -> [String: Any]? {
    
    if let data = self.data(using: .utf8) {
      do {
        return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
      } catch {
        print(error.localizedDescription)
      }
    }
      
    return nil
  }
}
