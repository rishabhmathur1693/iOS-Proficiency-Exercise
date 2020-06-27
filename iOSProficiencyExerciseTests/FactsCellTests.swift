//
//  FactsCellTests.swift
//  iOSProficiencyExerciseTests
//
//  Created by Rishabh Mathur on 27/06/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import XCTest
@testable import iOSProficiencyExercise

class FactsCellTests: XCTestCase {

  var viewController: FactsViewController!
  var tableView: UITableView!
  var indexPath: IndexPath!
  var dataProvider = FakeDataSource()

  override func setUpWithError() throws {
    viewController = FactsViewController()

    // Initializing view of FactsViewController
    _ = viewController.view

    tableView = viewController.tableView
    tableView.dataSource = dataProvider
    indexPath = IndexPath(row: 0, section: 0)
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testSUT_HasTitleLabel() {
    if let cell = tableView.dequeueReusableCell(
      withIdentifier: FactsCell.reuseIdentifier,
      for: indexPath) as? FactsCell {

      XCTAssertNotNil(cell.factTitle)
    }
  }

  func testSUT_HasDescriptionLabel() {
    if let cell = tableView.dequeueReusableCell(
      withIdentifier: FactsCell.reuseIdentifier,
      for: indexPath) as? FactsCell {

      XCTAssertNotNil(cell.factDescription)
    }
  }

  func testSUT_HasImageView() {
    if let cell = tableView.dequeueReusableCell(
      withIdentifier: FactsCell.reuseIdentifier,
      for: indexPath) as? FactsCell {

      XCTAssertNotNil(cell.factImageView)
    }
  }

  func testConfigWithItem_SetsLabelTexts() {
    if let cell = tableView.dequeueReusableCell(
      withIdentifier: FactsCell.reuseIdentifier,
      for: indexPath) as? FactsCell {

      let sampleTitle = "Beavers"
      let sampleDescription = """
                              Beavers are second only to humans in their ability
                              to manipulate and change their environment. They can measure up to
                              1.3 metres long. A group of beavers is called a colony.
                              """
      let sampleImageURL = """
                            https://upload.wikimedia.org/wikipedia/commons/thumb/6
                            /6b/American_Beaver.jpg/220px-American_Beaver.jpg
                            """
      let object = Row(title: sampleTitle, rowDescription: sampleDescription, imageHref: sampleImageURL)
      cell.prepareCellForDisplay(record: object)

      XCTAssertEqual(cell.factTitle.text, sampleTitle)
      XCTAssertEqual(cell.factDescription.text, sampleDescription)
      XCTAssertNotNil(cell.factImageView.image)
    }
  }
}

extension FactsCellTests {
  class FakeDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }
  }
}
