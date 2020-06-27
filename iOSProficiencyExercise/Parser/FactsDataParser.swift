//
//  FactsDataParser.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 25/06/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import Foundation

class FactsDataParser {

  func parseFacts<T: Decodable>(data: Data, convertToModel: T.Type) -> T? {

    // Fix: Used this fix as data is not decoding from JSONDecoder normally.
    let str = String(decoding: data, as: UTF8.self)
    guard let json = str.convertToDictionary() else {
      return nil
    }
    guard let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys) else {
      return nil
    }

    guard let factsObject = try? JSONDecoder().decode(T.self, from: jsonData) else {
      return nil
    }

    return factsObject
  }
}
