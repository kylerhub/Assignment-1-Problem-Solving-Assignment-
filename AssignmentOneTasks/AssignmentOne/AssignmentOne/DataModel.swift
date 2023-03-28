//
//  DataModel.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 28/3/2023.
//
import Foundation

struct Tasks: Hashable {
    var task: String
}

struct Checklist: Hashable {
    var checklist: String
    var tasks: [Tasks]?
}

struct DataModel{
    var checklists: [Checklist]
}

var testChecklists = [Checklist(checklist:"Checklist", tasks: [Tasks(task:"Watermelon, checkmark.circle")])]
