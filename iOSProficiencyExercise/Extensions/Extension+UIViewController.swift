//
//  Extension+UIViewController.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 04/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import UIKit

extension UIViewController {
  
  /// Lock whole screen to prevent user interaction
  /// - Returns: Void
  func lockView() -> Void {
    
    // Creating loader background view
    let loaderBackgroundView = UIView(frame: self.view.bounds)
    loaderBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    loaderBackgroundView.tag = Constants.viewLockTag
    
    // Creating UIActivityIndicatorView view for showing progress
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    activityIndicator.color = .white
    activityIndicator.tag = Constants.activityIndicatorViewTag
    
    // Adding views to respective superviews
    view.addSubview(loaderBackgroundView)
    loaderBackgroundView.addSubview(activityIndicator)
    
    // Setting constraints on loader background view
    loaderBackgroundView.addLeadingConstraint(toView: view)
    loaderBackgroundView.addTrailingConstraint(toView: view)
    loaderBackgroundView.addTopConstraint(toView: view)
    loaderBackgroundView.addBottomConstraint(toView: view)
    
    // Setting constraints on UIActivityIndicator view
    activityIndicator.addCenterXConstraint(toView: loaderBackgroundView)
    activityIndicator.addCenterYConstraint(toView: loaderBackgroundView)
    
    // Start loader spinning animation
    activityIndicator.startAnimating()
  }
  
  /// Unlock view and enable user interaction
  /// - Returns: Void
  func unlockView() -> Void {
    
    // Removing loader view from their respective superviews
    if let lockView = self.view.subviews.filter({ $0.tag == Constants.viewLockTag }).first {
      if let activityIndicator = lockView.subviews.filter({ $0.tag == Constants.activityIndicatorViewTag }).first as? UIActivityIndicatorView {
        activityIndicator.stopAnimating()
      }
      lockView.removeFromSuperview()
    }
  }
}
