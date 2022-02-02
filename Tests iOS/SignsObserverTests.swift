//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Bri on 2/1/22.
//

import XCTest
@testable import Signs

class SignsObserverTests: XCTestCase {
    
    var signsObserver: SignsObserver!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        signsObserver = SignsObserver()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        signsObserver = nil
    }
    
    func test_getSigns() async throws {
        try await signsObserver.getSigns()
        XCTAssert(!signsObserver.signs.isEmpty, "SignObserver.signs should not be empty")
    }

    func testSuccessfulLaunch() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
