//
//  FactsViewModel.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 02/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import Foundation

enum FactsError: Error {
  case noFactsAvailable
  case inValidData
}

typealias GetFactsDataCompletionHandler = (Result<FactsModel, FactsError>) -> Void

struct FactsViewModel {
  var factsArray: [Row]
  var title: String
  let factsAPI: String
  
  init(_ apiURL: String) {
    factsAPI = apiURL
    factsArray = []
    title = ""
  }
  
  mutating func updateFactsArray(_ array: [Row]) {
    factsArray = array
  }
  
  /// Function to get facts data
  /// - Parameter completion: Code block to be executed after API is executed
  /// - Returns: Void
  func getFactsFromAPI(completion: @escaping GetFactsDataCompletionHandler) -> Void {
    
    WebServiceHandler.getAPI(url: factsAPI) { (data) in
      guard let data = data else {
        completion(.failure(.inValidData))
        return
      }
      
      // Fix: Used this fix as data is not decoding from JSONDecoder normally.
      let str = String(decoding: data, as: UTF8.self)
      guard let json = str.convertToDictionary() else {
        completion(.failure(.inValidData))
        return
      }
      guard let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys) else {
        completion(.failure(.inValidData))
        return
      }
      
      guard let factsObject = try? JSONDecoder().decode(FactsModel.self, from: jsonData) else {
        completion(.failure(.inValidData))
        return
      }
      completion(.success(factsObject))
    }
  }
}
