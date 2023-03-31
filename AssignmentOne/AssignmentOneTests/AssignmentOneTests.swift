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
        let item1 = Items(item: "Milk", checkedStatus: "unchecked")
        let item2 = Items(item: "Cheese", checkedStatus: "checked")
        
        XCTAssert(item1.item == "Milk")
        XCTAssert(item1.checkedStatus == "unchecked")
        
        XCTAssert(item2.item == "Cheese")
        XCTAssert(item2.checkedStatus == "checked")
    }
    
    //function for testing the checklist struct
    func testChecklist() throws {
        let item1 = Items(item: "Milk", checkedStatus: "unchecked")
        let item2 = Items(item: "Cheese", checkedStatus: "checked")
        let checklist1 = Checklist(checklist: "Groceries", items: [item1, item2])
        
        XCTAssert(checklist1.checklist == "Groceries")
        XCTAssert(checklist1.items.count == 2)
        XCTAssert(checklist1.items.contains(item1))
        XCTAssert(checklist1.items.contains(item2))
    }
    
    //function for testing the datamodel struct
    func testDataModel() throws {
        let item1 = Items(item: "Buy milk", checkedStatus: "unchecked")
        let item2 = Items(item: "Pay bills", checkedStatus: "checked")
        let checklist1 = Checklist(checklist: "Groceries", items: [item1, item2])
        let dataModel = DataModel(checklists: [checklist1])
        
        XCTAssert(dataModel.checklists.count == 1)
        XCTAssert(dataModel.checklists.contains(checklist1))
    }}
