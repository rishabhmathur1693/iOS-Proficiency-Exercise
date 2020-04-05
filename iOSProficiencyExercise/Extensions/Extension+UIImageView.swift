//
//  Extension+UIImageView.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 04/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import UIKit

extension UIImageView {
  
  /// Function to fetch images from web URL
  /// - Parameter url: Image's web URL
  /// - Returns: Void
  func setImageFromURL(_ url: URL?) -> Void {
    if let url = url {
      // Creating loader background view
      let loaderView = UIView(frame: self.bounds)
      loaderView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
      
      // Creating UIActivityIndicatorView view for showing progress
      let activityIndicatorView = UIActivityIndicatorView(style: .medium)
      activityIndicatorView.color = .white
      
      // Adding views to respective superviews
      addSubview(loaderView)
      loaderView.addSubview(activityIndicatorView)
      
      // Setting constraints on loader background view
      loaderView.addLeadingConstraint(toView: self)
      loaderView.addTopConstraint(toView: self)
      loaderView.addTrailingConstraint(toView: self)
      loaderView.addBottomConstraint(toView: self)
      
      // Setting constraints on UIActivityIndicator view
      activityIndicatorView.addLeadingConstraint(toView: loaderView)
      activityIndicatorView.addTopConstraint(toView: loaderView)
      activityIndicatorView.addTrailingConstraint(toView: loaderView)
      activityIndicatorView.addBottomConstraint(toView: loaderView)
      
      // Start loader spinning animation
      activityIndicatorView.startAnimating()
      
      // Using default background thread to fetch images from URL
      DispatchQueue.global().async {[weak self] in
        if let self = self {
          if let data = try? Data(contentsOf: url) {
            DispatchQueue.main.async {
              activityIndicatorView.stopAnimating()
              self.subviews.forEach({ $0.removeFromSuperview() })
            }
            if data.count > 0, let image = UIImage(data: data) {
              DispatchQueue.main.async {
                self.image = image
              }
            } else {
              DispatchQueue.main.async {
                self.image = UIImage(named: "sampleImage")
              }
            }
          }
        }
      }
    }
  }
}
