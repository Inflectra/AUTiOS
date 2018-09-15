//
//  AUTiOSUITests.swift
//  AUTiOSUITests
//
//  Created by Denis Markovtsev on 04/04/2017.
//  Copyright © 2017 Inflectra. All rights reserved.
//

import XCTest

class AUTiOSUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testMaster() {
        
        
        XCUIDevice.shared().orientation = .faceUp
        XCUIDevice.shared().orientation = .faceUp
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Master - Detail Table View"].tap()
        tablesQuery.staticTexts["Button"].tap()
        app.navigationBars["Detail"].buttons["Master"].tap()
        
        let masterNavigationBar = app.navigationBars["Master"]
        masterNavigationBar.buttons["Add"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).matching(identifier: "New Item Name").element(boundBy: 1).tap()
        app.buttons["Clear text"].tap()
        app.textFields.containing(.button, identifier:"Clear text").element.typeText("tree")
        app.navigationBars["New Item Navigation"].buttons["Save"].tap()
        masterNavigationBar.buttons["Edit"].tap()
        tablesQuery.buttons["Delete tree"].tap()
        tablesQuery.buttons["Delete"].tap()
        masterNavigationBar.buttons["Done"].tap()
        masterNavigationBar.buttons["AUTiOS"].tap()
        
        
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app1 = XCUIApplication()
        let tablesQuery1 = app.tables
        tablesQuery1.staticTexts["Master - Detail Table View"].tap()
        tablesQuery1.staticTexts["Button"].tap()
        app.navigationBars["Detail"].buttons["Master"].tap()
        
        let masterNavigationBar1 = app1.navigationBars["Master"]
        let addButton = masterNavigationBar1.buttons["Add"]
        addButton.tap()
        
        let newItemNameTextField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).matching(identifier: "New Item Name").element(boundBy: 1)
        
        newItemNameTextField.tap()
        app.buttons["Clear text"].tap()
        app.typeText("Tree")
        app.navigationBars["New Item Navigation"].buttons["Save"].tap()
        masterNavigationBar.buttons["AUTiOS"].tap()
       
    }
    
    func testBasicControls() {
        XCUIApplication().tables.staticTexts["Basic Controls"].tap()
        
        let app = XCUIApplication()
        //let enterAMessageTextField = app.textFields["Enter a message"]
        //enterAMessageTextField.tap()
        //enterAMessageTextField.typeText("Hello World!")
        //app.buttons["Send"].tap()
        //app.alerts["Message"].buttons["OK"].tap()
        
        app.pickerWheels["Mercury"].adjust(toPickerWheelValue: "Venus")
        let sw = app.switches["0"]
        sw.tap()
        
        let slider = app.sliders["50%"]
        slider.adjust(toNormalizedSliderPosition: 0.6)
        
    }
    
}
