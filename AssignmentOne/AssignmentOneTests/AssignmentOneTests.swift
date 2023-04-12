//
//  AssignmentOneTests.swift
//  AssignmentOneTests
//
//  Created by jennifer-wei lin on 14/3/2023.
//
import XCTest
@testable import AssignmentOne

final class AssignmentOneTests: XCTestCase {

    //function for testing the items struct
    func testItems() throws {
        let item1 = Items(item: "Milk", checkedStatus: "unchecked", newCheckedStatus: "")
        let item2 = Items(item: "Cheese", checkedStatus: "checked", newCheckedStatus: "")
        
        XCTAssert(item1.item == "Milk")
        XCTAssert(item1.checkedStatus == "unchecked")
        
        XCTAssert(item2.item == "Cheese")
        XCTAssert(item2.checkedStatus == "checked")
    }
    
    //function for testing the datamodel struct
    func testDataModel() throws {
        let dataModel = DataModel()
        XCTAssert(dataModel.checklists.count == 1)
    }
    
}
