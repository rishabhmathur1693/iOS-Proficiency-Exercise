//
//  Extension+UIView.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 04/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import UIKit

extension UIView {
  
  func addSubViews(_ subViews: UIView...) {
    subViews.forEach({ addSubview($0) })
  }
}
