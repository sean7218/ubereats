//
//  UberEATSTests.swift
//  UberEATSTests
//
//  Created by Sean Zhang on 11/25/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import XCTest
@testable import UberEATS

class UberEATSTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGoogleAccessKey() {
        let appDelegate = AppDelegate()
        let key = appDelegate.GOOGLE_KEY
        XCTAssertEqual(key, KEYS.GOOGLE_MAP_KEY)
    }
    
    func testBearAccessKey() {
        let key = KEYS.ACCESS_BEAR_KEY
        XCTAssertNotNil(key)
    }
    
    func testApplicationLaunch() {
        let appDelegate = AppDelegate()
        let isLaunched = appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
        XCTAssertEqual(isLaunched, true)
    }
    
    func testFilterViewController() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let homeViewController = HomeViewController(collectionViewLayout: layout)
        let filterViewController = homeViewController.filterViewController
        XCTAssertNotNil(filterViewController)
    }
    
}
