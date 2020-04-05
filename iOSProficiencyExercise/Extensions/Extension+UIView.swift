//
//  Extension+UIView.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 04/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import UIKit

extension UIView {
  
  /// Function to add multipler views to a superview
  /// - Parameter subViews: Array of UIView using variadic parameters
  func addSubViews(_ subViews: UIView...) -> Void {
    subViews.forEach({ addSubview($0) })
  }
  
  /// Clipping view to all edges of its superview
  func anchorToSuperViewEdges() -> Void {
    if let superview = superview?.safeAreaLayoutGuide {
      leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
      trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
      topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
      addBottomConstraint(toView: self.superview!, attribute: .bottom)
    }
  }
  
  /// Enable auto layout constraints on a UIView element
  func enableAutoLayout() -> Void {
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  /// Disable auto layout constraints on a UIView element
  func disableAutoLayout() -> Void {
    translatesAutoresizingMaskIntoConstraints = true
  }
  
  /// Function to add leading constraint on a UIView element
  /// - Parameters:
  ///   - view: View to which the constraint is applied
  ///   - attribute: Type of NSLayoutConstraint attribute
  ///   - relation: Type of NSLayoutConstraint relation
  ///   - multiplier: Multiplier value of constraint
  ///   - constant:Constant value of constraint
  /// - Returns: Void
  func addLeadingConstraint(
    toView view: UIView,
    attribute: NSLayoutConstraint.Attribute = .leading,
    relation: NSLayoutConstraint.Relation = .equal,
    multiplier: CGFloat = 1.0,
    constant: CGFloat = 0.0) -> Void {
    
    enableAutoLayout()
    
    NSLayoutConstraint(item: self, attribute: .leading, relatedBy: relation, toItem: view, attribute: attribute, multiplier: multiplier, constant: constant).isActive = true
  }
  
  /// Function to add traling constraint on a UIView element
  /// - Parameters:
  ///   - view: View to which the constraint is applied
  ///   - attribute: Type of NSLayoutConstraint attribute
  ///   - relation: Type of NSLayoutConstraint relation
  ///   - multiplier: Multiplier value of constraint
  ///   - constant:Constant value of constraint
  /// - Returns: Void
  func addTrailingConstraint(
    toView view: UIView,
    attribute: NSLayoutConstraint.Attribute = .trailing,
    relation: NSLayoutConstraint.Relation = .equal,
    multiplier: CGFloat = 1.0,
    constant: CGFloat = 0.0) -> Void {
    
    enableAutoLayout()
    
    NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: relation, toItem: view, attribute: attribute, multiplier: multiplier, constant: constant).isActive = true
  }
  
  /// Function to add top constraint on a UIView element
  /// - Parameters:
  ///   - view: View to which the constraint is applied
  ///   - attribute: Type of NSLayoutConstraint attribute
  ///   - relation: Type of NSLayoutConstraint relation
  ///   - multiplier: Multiplier value of constraint
  ///   - constant:Constant value of constraint
  /// - Returns: Void
  func addTopConstraint(
    toView view: UIView,
    attribute: NSLayoutConstraint.Attribute = .top,
    relation: NSLayoutConstraint.Relation = .equal,
    multiplier: CGFloat = 1.0,
    constant: CGFloat = 0.0) -> Void {
    
    enableAutoLayout()
    
    NSLayoutConstraint(item: self, attribute: .top, relatedBy: relation, toItem: view, attribute: attribute, multiplier: multiplier, constant: constant).isActive = true
  }
  
  /// Function to add bottom constraint on a UIView element
  /// - Parameters:
  ///   - view: View to which the constraint is applied
  ///   - attribute: Type of NSLayoutConstraint attribute
  ///   - relation: Type of NSLayoutConstraint relation
  ///   - multiplier: Multiplier value of constraint
  ///   - constant:Constant value of constraint
  /// - Returns: Void
  func addBottomConstraint(
    toView view: UIView,
    attribute: NSLayoutConstraint.Attribute = .bottom,
    relation: NSLayoutConstraint.Relation = .equal,
    multiplier: CGFloat = 1.0,
    constant: CGFloat = 0.0) -> Void {
    
    enableAutoLayout()
    
    NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: relation, toItem: view, attribute: attribute, multiplier: multiplier, constant: constant).isActive = true
  }
  
  /// Function to add width constraint on a UIView element
  /// - Parameters:
  ///   - view: View to which the constraint is applied
  ///   - attribute: Type of NSLayoutConstraint attribute
  ///   - relation: Type of NSLayoutConstraint relation
  ///   - multiplier: Multiplier value of constraint
  ///   - constant:Constant value of constraint
  /// - Returns: Void
  func addWidthConstraint(
    toView view: UIView?,
    attribute: NSLayoutConstraint.Attribute = .width,
    relation: NSLayoutConstraint.Relation = .equal,
    multiplier: CGFloat = 1.0,
    constant: CGFloat = 0.0) -> Void {
    
    enableAutoLayout()
    
    NSLayoutConstraint(item: self, attribute: .width, relatedBy: relation, toItem: view, attribute: attribute, multiplier: multiplier, constant: constant).isActive = true
  }
  
  /// Function to add height constraint on a UIView element
  /// - Parameters:
  ///   - view: View to which the constraint is applied
  ///   - attribute: Type of NSLayoutConstraint attribute
  ///   - relation: Type of NSLayoutConstraint relation
  ///   - multiplier: Multiplier value of constraint
  ///   - constant:Constant value of constraint
  /// - Returns: Void
  func addHeightConstraint(
    toView view: UIView?,
    attribute: NSLayoutConstraint.Attribute = .height,
    relation: NSLayoutConstraint.Relation = .equal,
    multiplier: CGFloat = 1.0,
    constant: CGFloat = 0.0) -> Void {
    
    enableAutoLayout()
    
    NSLayoutConstraint(item: self, attribute: .height, relatedBy: relation, toItem: view, attribute: attribute, multiplier: multiplier, constant: constant).isActive = true
  }
  
  /// Function to add centerX constraint on a UIView element
  /// - Parameters:
  ///   - view: View to which the constraint is applied
  ///   - attribute: Type of NSLayoutConstraint attribute
  ///   - relation: Type of NSLayoutConstraint relation
  ///   - multiplier: Multiplier value of constraint
  ///   - constant:Constant value of constraint
  /// - Returns: Void
  func addCenterXConstraint(
    toView view: UIView,
    attribute: NSLayoutConstraint.Attribute = .centerX,
    relation: NSLayoutConstraint.Relation = .equal,
    multiplier: CGFloat = 1.0,
    constant: CGFloat = 0.0) -> Void {
    
    enableAutoLayout()
    
    NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: relation, toItem: view, attribute: attribute, multiplier: multiplier, constant: constant).isActive = true
  }
  
  /// Function to add centerY constraint on a UIView element
  /// - Parameters:
  ///   - view: View to which the constraint is applied
  ///   - attribute: Type of NSLayoutConstraint attribute
  ///   - relation: Type of NSLayoutConstraint relation
  ///   - multiplier: Multiplier value of constraint
  ///   - constant:Constant value of constraint
  /// - Returns: Void
  func addCenterYConstraint(
    toView view: UIView,
    attribute: NSLayoutConstraint.Attribute = .centerX,
    relation: NSLayoutConstraint.Relation = .equal,
    multiplier: CGFloat = 1.0,
    constant: CGFloat = 0.0) -> Void {
    
    enableAutoLayout()
    
    NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: relation, toItem: view, attribute: attribute, multiplier: multiplier, constant: constant).isActive = true
  }
}
