//
//  ViewController.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 02/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import UIKit

class FactsVC: UIViewController {

  // MARK: - Properties
  private var viewModel: FactsViewModel = {
    return FactsViewModel.init(Constants.apiURL)
  }()
  
  private let tableView: UITableView = {
    let tableView = UITableView()
    
    let footerViewFrame = CGRect(x: 0,
                                 y: 0,
                                 width: tableView.bounds.width,
                                 height: 30)
    let footerView = UIView(frame: footerViewFrame)
    
    footerView.backgroundColor = .white
    tableView.tableFooterView = footerView
    tableView.estimatedRowHeight = 200.0
    tableView.rowHeight = UITableView.automaticDimension
    return tableView
  }()
  
  private lazy var emptyTableMessage: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
    label.text = "No facts available"
    label.tag = Constants.emptyTableMessageLabelTag
    return label
  }()
  
  private let refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.tintColor = .gray
    refreshControl.addTarget(self, action: #selector(pullToRefersh(_:)), for: .valueChanged)
    return refreshControl
  }()
  
  // MARK: - Lifecycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    view.addSubview(tableView)
    configureTableView()
    getFacts()
  }
  
  // MARK: - Private Methods
  private func configureTableView() {
    tableView.register(
      FactsCell.self,
      forCellReuseIdentifier: FactsCell.reuseIdentifier)
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.refreshControl = refreshControl
    
    addTableViewConstraints()
  }
  
  @objc private func pullToRefersh(_ refershControl: UIRefreshControl) {
    refershControl.endRefreshing()
    
    getFacts()
  }
  
  private func addTableViewConstraints() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
  
  private func addEmptyTableViewLabelConstraints() {
    emptyTableMessage.translatesAutoresizingMaskIntoConstraints = false
    emptyTableMessage.centerYAnchor.constraint(equalTo: tableView.centerYAnchor).isActive = true
    emptyTableMessage.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
  }
  
  private func reloadTable() {
    
    if viewModel.factsArray.count == 0 {
      tableView.bounces = false
      tableView.addSubview(emptyTableMessage)
      
      addEmptyTableViewLabelConstraints()
    } else {
      tableView.bounces = true
      if let tableViewEmptyTextLabel = tableView.subviews.filter({ $0.tag == Constants.emptyTableMessageLabelTag }).first {
        tableViewEmptyTextLabel.removeFromSuperview()
      }
    }
    
    tableView.reloadData()
  }
  
  private func getFacts() {
    
    viewModel.getFactsFromAPI {[weak self] (result) in
      switch result {
      case .failure(.noFactsAvailable):
        break
      case .failure(.inValidData):
        break
      case .success(let factsResponse):
        if let self = self {
          self.viewModel.factsArray = factsResponse.rows ?? []
          DispatchQueue.main.async {
            self.title = factsResponse.title ?? ""
            self.reloadTable()
          }
        }
      }
    }
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    tableView.reloadData()
  }
}

// MARK: - UITableViewDelegate
extension FactsVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.factsArray.count
  }
}

// MARK: - UITableViewDataSource
extension FactsVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let record = viewModel.factsArray[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: FactsCell.reuseIdentifier) as! FactsCell
    cell.prepareCellForDisplay(record: record)
    return cell
  }
}
