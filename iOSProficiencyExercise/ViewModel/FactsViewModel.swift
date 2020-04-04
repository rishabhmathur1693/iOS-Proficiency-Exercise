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

struct FactsViewModel {
  var factsArray: [Row]
  var title: String
  let factsAPI: String
  
  init(_ apiURL: String) {
    factsAPI = apiURL
    factsArray = []
    title = ""
  }
  
  func getFactsFromAPI(completion: @escaping(Result<FactsModel, FactsError>) -> Void) -> Void {
    guard let url = URL(string: factsAPI) else { return }
    let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
    
    let task = URLSession.shared.dataTask(with: urlRequest) {(data, _, _) in
      if let data = data {
        do {
          let str = String(decoding: data, as: UTF8.self)
          if let json = str.convertToDictionary() {
            
            let newData = try JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
            
            let factsObject = try JSONDecoder().decode(FactsModel.self, from: newData)
            
            completion(.success(factsObject))
          }
        } catch let error {
          print(error.localizedDescription)
          completion(.failure(.inValidData))
        }
      } else {
        completion(.failure(.inValidData))
      }
    }
    
    task.resume()
  }
}
