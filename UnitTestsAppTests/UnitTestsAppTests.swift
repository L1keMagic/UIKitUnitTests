//
//  UnitTestsAppTests.swift
//  UnitTestsAppTests
//
//  Created by Артур Карачев on 11.09.2021.
//

import XCTest
@testable import UnitTestsApp

class UnitTestsAppTests: XCTestCase {

    var fieldValidator: FieldValidator!
    override func setUpWithError() throws {
        fieldValidator = FieldValidatorImpl()
    }

    override func tearDownWithError() throws {
        fieldValidator = nil
    }

    func testValidatorCorrectEmptyValues() throws {
        
        // Given
        let loginTF = UITextField()
        let passwordTF = UITextField()
        let expectedResult = false
        var validateResult: Bool
        // When
        validateResult = fieldValidator.validateLoginTextFields(loginTF: loginTF, passwordTF: passwordTF)
        // Then
        XCTAssertEqual(expectedResult, validateResult)
    }
    
    func testValidatorCorrectValues() throws {
        
        // Given
        let loginTF = UITextField()
        loginTF.text = "admin"
        let passwordTF = UITextField()
        passwordTF.text = "123"
        let expectedResult = true
        var validateResult: Bool
        // When
        validateResult = fieldValidator.validateLoginTextFields(loginTF: loginTF, passwordTF: passwordTF)
        // Then
        XCTAssertEqual(expectedResult, validateResult)
    }
    
    // For Acync Functions
    func testAsyncValidatorCorrectValues() throws {
        // Given
        let loginTF = UITextField()
        let passwordTF = UITextField()
        let expectedResult = false
        var validateResult: Bool?
        let validatorExpectation = expectation(description: "Expectation in" + #function)
        // When
        fieldValidator.acyncValidateLoginTextFields(loginTF: loginTF, passwordTF: passwordTF) { (isValid) in
            validateResult = isValid
            
            validatorExpectation.fulfill()
        }
        // Then
        waitForExpectations(timeout: 2.0) { (error) in
            if error != nil {
                XCTFail()
            }
            XCTAssertEqual(expectedResult, validateResult)
        }
    }

}
