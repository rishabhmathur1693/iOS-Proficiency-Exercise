//
//  ViewController.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 02/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import UIKit

class FactsVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    let viewModel = FactsViewModel.init(apiURL)
    viewModel.getFactsFromAPI { (result) in
      switch result {
      case .failure(.noFactsAvailable):
        break
      case .failure(.inValidData):
        break
      case .success(let factsArray):
        print(factsArray)
      }
    }
  }
}
