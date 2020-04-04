//
//  CacheManager.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 04/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import Foundation

class CacheManager {
  
  static let shared = CacheManager()
  
  let cache = NSCache<NSString, AnyObject>()
  
  func addToCache(objectToCache object: AnyObject , withKey key: String) {
    cache.setObject(object, forKey: key as NSString)
  }
  
  func objectFromCache(withKey key: String) -> AnyObject? {
      return cache.object(forKey: key as NSString)
  }
}
