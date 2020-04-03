//
//  WebServicesHandler.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 03/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
  case get = "GET"
  case post = "POST"
}

struct WebServicesHandler {
  typealias CompletionHandler = (Any?) -> Void
  typealias FailureHandler = (Error?) -> Void
  
  static func callAPI(url: String, httpMethod: HTTPMethod, parameters: [String: Any]? = nil, successHandler: @escaping CompletionHandler, failureHandler: @escaping FailureHandler) {
    
    guard let apiURL = URL(string: url) else { return }
    
    var urlRequest = URLRequest(
      url: apiURL,
      cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
      timeoutInterval: 30)
    urlRequest.httpMethod = httpMethod.rawValue
    
    if let parameters = parameters,
       let postData = try? JSONSerialization.data(
        withJSONObject: parameters,
        options: .prettyPrinted) {
      
      urlRequest.httpBody = postData
    }
    
    let task = URLSession.shared.dataTask(with: urlRequest) {
      (data, urlResponse, error) in
      
      if let data = data, error == nil {
        let jsonString = String(decoding: data, as: UTF8.self)
        if let responseDictionary = jsonString.convertToDictionary() {
          do {
            let newData = try JSONSerialization.data(withJSONObject: responseDictionary, options: .sortedKeys)
            
            let apiResponse = try JSONDecoder().decode(FactsModel.self, from: newData)
            successHandler(apiResponse)
          } catch let error {
            failureHandler(error)
          }
        }
      } else {
        failureHandler(nil)
      }
    }
    
    task.resume()
  }
}
