//
//  iOSProficiencyExerciseTests.swift
//  iOSProficiencyExerciseTests
//
//  Created by Rishabh Mathur on 26/06/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import XCTest
@testable import iOSProficiencyExercise

class FactsViewControllerTests: XCTestCase {

  var viewController: FactsViewController!
  var tableView: UITableView!

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    viewController = FactsViewController()

    // Initializing view of FactsViewController
    _ = viewController.view

    tableView = viewController.tableView
  }

  override func tearDownWithError() throws {
    viewController = nil
    tableView = nil
  }

  func testTableViewIsNotNilAfterViewDidLoad() {
    XCTAssertNotNil(tableView)
  }

  func testTableCellIsRegisteredAfterViewDodLoad() {
    let cell = tableView.dequeueReusableCell(withIdentifier: FactsCell.reuseIdentifier)
    XCTAssertNotNil(cell)
    XCTAssertTrue(cell is FactsCell)
  }

  func testViewDidLoadShouldSetTableViewDataSource() {
    XCTAssertNotNil(tableView.dataSource)
    XCTAssertTrue(tableView.dataSource is FactsViewController)
  }

  func testViewDidLoad_ShouldSetTableViewDelegate() {
    XCTAssertNotNil(tableView.delegate)
    XCTAssertTrue(tableView.delegate is FactsViewController)
  }

  func testViewDidLoad_ShouldSetDelegateAndDataSourceToTheSameObject() {
    XCTAssertEqual(tableView.dataSource as? FactsViewController, tableView.delegate as? FactsViewController)
  }

  func testAPIJSONStructure() {
    let bundle = Bundle(for: type(of: self))

    guard let path = bundle.url(forResource: "APIResponse", withExtension: "json") else {
        XCTFail("Missing file: APIResponse.json")
        return
    }

    do {
      let data = try Data(contentsOf: path, options: .mappedIfSafe)
      guard let factsObject = try? JSONDecoder().decode(FactsModel.self, from: data) else { return }

      XCTAssertNotNil(factsObject)
      XCTAssertNotNil(factsObject.rows)

      if let rows = factsObject.rows {
        XCTAssertEqual(rows.count, 14)
      }
    } catch {
      // handle error
    }
  }
}

extension FactsViewControllerTests {
  class FakeDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }
  }
}
