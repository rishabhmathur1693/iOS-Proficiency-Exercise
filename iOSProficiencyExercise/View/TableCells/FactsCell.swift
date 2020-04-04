//
//  FactsCell.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 04/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import UIKit

class FactsCell: UITableViewCell, ReuseIdentifying {
  
  // MARK: - Properties
  private let factTitle: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
    label.textAlignment = .left
    return label
  }()
  
  private let factDescription: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = .left
    return label
  }()
  
  private let factImageView: CustomImageView = {
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
    
    addSubViews(factTitle, factImageView, factDescription)
    configureCell()
  }
  
  // MARK: - Private Methods
  private func setFactImageViewConstraints() {
    
    factImageView.translatesAutoresizingMaskIntoConstraints = false
    factImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    factImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    factImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10).isActive = true
    factImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    factImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
  }
  
  private func setFactDescriptionLabelConstraints() {
    
    factTitle.translatesAutoresizingMaskIntoConstraints = false
    factTitle.leadingAnchor.constraint(equalTo: factImageView.trailingAnchor, constant: 10).isActive = true
    factTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    factTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
  }
  
  private func setFactTitleLabelConstraints() {
    
    factDescription.translatesAutoresizingMaskIntoConstraints = false
    factDescription.leadingAnchor.constraint(equalTo: factTitle.leadingAnchor).isActive = true
    factDescription.topAnchor.constraint(equalTo: factTitle.bottomAnchor, constant: 5).isActive = true
    factDescription.trailingAnchor.constraint(equalTo: factTitle.trailingAnchor).isActive = true
    factDescription.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10).isActive = true
  }
  
  private func configureCell() {
    
    selectionStyle = .none
    
    setFactImageViewConstraints()
    setFactDescriptionLabelConstraints()
    setFactTitleLabelConstraints()
  }
  
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
