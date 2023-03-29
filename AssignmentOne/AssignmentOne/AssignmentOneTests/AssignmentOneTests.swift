//
//  AssignmentOneTests.swift
//  AssignmentOneTests
//
//  Created by jennifer-wei lin on 14/3/2023.
//
import XCTest
@testable import AssignmentOne

final class AssignmentOneTests: XCTestCase {

    func testExample() throws {
        let ListRowView = ListRowView(item: ["Milk","checkmark.circle"])
        XCTAssertEqual(ListRowView.item[0], "Milk")
        XCTAssertEqual(ListRowView.item[1], "checkmark.circle")
    }

}
