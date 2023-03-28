//
//  DataModel.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 28/3/2023.
//
import Foundation

struct Items: Hashable {
    var item: String
}

struct Checklist: Hashable {
    var checklist: String
    var items: [Items]
}

struct DataModel{
    var checklists: [Checklist]
}

var testChecklists = [Checklist(checklist:"Checklist", items: [Items(item:"Watermelon, checkmark.circle")])]
