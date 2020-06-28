//
//  FactsCell.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 04/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import UIKit

class FactsCell: UITableViewCell, ReuseIdentifierProtocol {

  // MARK: - Properties

  let factTitle: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
    label.textAlignment = .left
    return label
  }()

  let factDescription: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = .left
    return label
  }()

  let factImageView: CustomImageView = {
    let imageView = CustomImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 10.0
    imageView.layer.masksToBounds = true
    return imageView
  }()

  // MARK: - Lifecycle Methods

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    configureCell()
  }

  // MARK: - Private Methods

  /// Function to configure cell UI
  private func configureCell() {

    selectionStyle = .none

    addSubViews(factImageView, factTitle, factDescription)

    setFactImageViewConstraints()
    setFactTitleLabelConstraints()
    setFactDescriptionLabelConstraints()
  }

  /// Function to display data on cell
  /// - Parameter record: Fact record passed from view controller
  func prepareCellForDisplay(record: Row) {

    factTitle.text = record.title ?? ""
    factDescription.text = record.rowDescription ?? " "

    if record.imageHref == nil {
      factImageView.image = UIImage(named: "sampleImage")
    } else {
      factImageView.setImageFromURL(urlString: record.imageHref ?? "")
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Extension for setting constraints on views
extension FactsCell {

  /// Set constraints for factImageView
  private func setFactImageViewConstraints() {

    factImageView.addLeadingConstraint(
      toView: self,
      attribute: .centerX,
      relation: .equal,
      multiplier: 10/187.5,
      constant: 0)

    factImageView.addTopConstraint(
      toView: self,
      attribute: .top,
      relation: .equal,
      constant: 10)

    factImageView.addWidthConstraint(
      toView: nil,
      attribute: .width,
      relation: .equal,
      multiplier: 1,
      constant: 100)

    factImageView.addHeightConstraint(
      toView: nil,
      attribute: .height,
      relation: .equal,
      multiplier: 1,
      constant: 100)

    factImageView.addBottomConstraint(
      toView: self,
      attribute: .bottom,
      relation: .lessThanOrEqual,
      multiplier: 1,
      constant: -10)
  }

  /// Set constraints for factTitle
  private func setFactTitleLabelConstraints() {

    factTitle.addTopConstraint(toView: factImageView)

    factTitle.addLeadingConstraint(
      toView: factImageView,
      attribute: .trailing,
      relation: .equal,
      multiplier: 1,
      constant: 10)

    factTitle.addTrailingConstraint(
      toView: self,
      attribute: .centerX,
      relation: .equal,
      multiplier: 365/187.5,
      constant: 0)
  }

  /// Set constraints for factDescription
  private func setFactDescriptionLabelConstraints() {

    factDescription.addLeadingConstraint(toView: factTitle)
    factDescription.addTrailingConstraint(toView: factTitle)

    factDescription.addTopConstraint(
      toView: factTitle,
      attribute: .bottom,
      relation: .equal,
      multiplier: 1,
      constant: 5)

    factDescription.addBottomConstraint(
      toView: self,
      attribute: .bottom,
      relation: .lessThanOrEqual,
      multiplier: 1,
      constant: -10)
  }
}
