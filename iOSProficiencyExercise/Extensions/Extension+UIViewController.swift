//
//  Extension+UIViewController.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 04/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func lockView() {
    
    let view = UIView(frame: self.view.bounds)
    view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    view.tag = Constants.viewLockTag
    
    self.view.addSubview(view)
    
    view.translatesAutoresizingMaskIntoConstraints = false
    view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    activityIndicator.color = .white
    activityIndicator.tag = Constants.activityIndicatorViewTag
    activityIndicator.startAnimating()
    
    view.addSubview(activityIndicator)
    
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
  
  func unlockView() {
    
    if let lockView = self.view.subviews.filter({ $0.tag == Constants.viewLockTag }).first {
      if let activityIndicator = lockView.subviews.filter({ $0.tag == Constants.activityIndicatorViewTag }).first as? UIActivityIndicatorView {
        activityIndicator.stopAnimating()
      }
      lockView.removeFromSuperview()
    }
  }
}
