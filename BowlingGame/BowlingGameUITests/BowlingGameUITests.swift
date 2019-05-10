import XCTest

class BowlingGameUITests: XCTestCase {

    
    override func setUp() {
        XCUIApplication().launch()
    }
    
    func test_IfAllButtonsAreTappable() {
        
        let app = XCUIApplication()

        let button = app.buttons["0"]
        button.tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["4"].tap()
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        button.tap()
        app.buttons["7"].tap()
        button.tap()
        app.buttons["8"].tap()
        button.tap()
        app.buttons["9"].tap()
        button.tap()
        app.buttons["X"].tap()
        app.buttons["Calculate"].tap()
        app.alerts["Score Is"].buttons["OK"].tap()
    }
    
    func test_TextInPinsInputLabelShouldBeOne_WhenOneIsSelected() {
        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        
        let inputValueLabel:String = app.otherElements.staticTexts["pinsInput"].label

        XCTAssertEqual(inputValueLabel, "1")
    }
    
    func test_TextInInputLabelShouldBeInput() {
        let app = XCUIApplication()
        app.buttons["1"].tap()
        
        let inputLabel:String = app.otherElements.staticTexts["InputLabel"].label
        
        XCTAssertEqual(inputLabel, "Input : ")
    }
    
    func test_ShouldShowAlertWhenCalculateButtonIsTapped() {
        let app = XCUIApplication()
        
        let button = app.buttons["0"]
        button.tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["4"].tap()
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        button.tap()
        app.buttons["7"].tap()
        button.tap()
        app.buttons["8"].tap()
        button.tap()
        app.buttons["9"].tap()
        button.tap()
        app.buttons["X"].tap()
        app.buttons["Calculate"].tap()
        
        let didShowScoreAlert = app.alerts["Alert"]
        XCTAssertTrue(didShowScoreAlert.exists)
    }
    
    func test_ShouldShowErrorAlert_WhenInputIsMoreThan21digitlength() {
        
        let app = XCUIApplication()
        
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        app.buttons["X"].tap()
        
        let didShowScoreAlert = app.alerts["Alert"]
        XCTAssertTrue(didShowScoreAlert.exists)
    }
}
