//
//  UnitTestsAppUITests.swift
//  UnitTestsAppUITests
//
//  Created by Артур Карачев on 11.09.2021.
//

import XCTest

class UnitTestsAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWarningAlert() throws {
        let app = XCUIApplication()
        app.launch()

        app.textFields["LoginTF"].tap()
        app.textFields["LoginTF"].typeText("User Login")
        app.buttons["Next:"].tap()

        app.textFields["PasswordTF"].tap()
        app.textFields["PasswordTF"].typeText("password")
        app.buttons["Done"].tap()
        
        XCTAssert(app.alerts["Warning"].descendants(matching: .staticText)["Invalid Fields"].waitForExistence(timeout: 1.0))
    }
    
    func testNestScreenExistsAfterLogin() throws {
        let app = XCUIApplication()
        app.launch()

        app.textFields["LoginTF"].tap()
        app.textFields["LoginTF"].typeText("User Login")
        app.buttons["Next:"].tap()

        app.textFields["PasswordTF"].tap()
        app.textFields["PasswordTF"].typeText("123")
        app.buttons["Done"].tap()
        
        XCTAssert(app.navigationBars["Main"].waitForExistence(timeout: 1.0))
    }

}
