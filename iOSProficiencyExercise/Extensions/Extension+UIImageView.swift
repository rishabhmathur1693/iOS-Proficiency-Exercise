//
//  Extension+UIImageView.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 04/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import UIKit

extension UIImageView {
  
  func setImageFromURL(_ url: URL?) {
    if let url = url {
      let loaderView = UIView(frame: self.bounds)
      
      loaderView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
      let activityIndicatorView = UIActivityIndicatorView(style: .medium)
      activityIndicatorView.color = .white
      
      self.addSubview(loaderView)
      loaderView.addSubview(activityIndicatorView)
      
      loaderView.translatesAutoresizingMaskIntoConstraints = false
      loaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
      loaderView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
      loaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
      loaderView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
      
      activityIndicatorView.translatesAutoresizingMaskIntoConstraints = true
      activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
      activityIndicatorView.leadingAnchor.constraint(equalTo: loaderView.leadingAnchor).isActive = true
      activityIndicatorView.topAnchor.constraint(equalTo: loaderView.topAnchor).isActive = true
      activityIndicatorView.trailingAnchor.constraint(equalTo: loaderView.trailingAnchor).isActive = true
      activityIndicatorView.bottomAnchor.constraint(equalTo: loaderView.bottomAnchor).isActive = true
      
      activityIndicatorView.startAnimating()
      
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
