//
//  DataModel.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 28/3/2023.
//
import Foundation

//struct for all items with their checkedStatus
struct Items: Hashable {
    var item: String
    var checkedStatus: String
}

//struct for checklists with alll items
struct Checklist: Hashable {
    var checklist: String
    var items: [Items]
}

//struct for all the checklists
struct DataModel{
    var checklists: [Checklist]
}

var testChecklists = [Checklist(checklist:"Checklist", items: [Items(item:"Item", checkedStatus: "")])]
