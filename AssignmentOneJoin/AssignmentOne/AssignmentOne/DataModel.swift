//
//  DataModel.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 28/3/2023.
//
import Foundation

struct Checklist: Hashable {
    var checklist: String
    var tasks: [[String]]?
}

struct DataModel{
    var checklists: [Checklist]
}

var testChecklists = [Checklist(checklist:"Checklist 1", tasks: [["Milk","checkmark.circle","Checklist 1"],
    ["Sugar","",""],
    ["Bread","",""],
    ["Cheese","checkmark.circle",""]]
    )
    ]
