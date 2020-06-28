//
//  NetworkHandlerTests.swift
//  iOSProficiencyExerciseTests
//
//  Created by Rishabh Mathur on 28/06/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import XCTest
@testable import iOSProficiencyExercise

class NetworkHandlerTests: XCTestCase {

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testInternetConnectivity() throws {
    let connectionStatus = NetworkHandler().isNetworkConnectionAvailable()
    XCTAssertTrue(connectionStatus)
  }
}
