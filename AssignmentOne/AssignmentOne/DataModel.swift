//
//  DataModel.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 28/3/2023.
//
import Foundation

//struct for all items with their checkedStatus
struct Items: Hashable, Codable {
    var item: String
    var checkedStatus: String
}

func fileurl() -> URL? {
    let fileName = "myitems.json"
    let filemanager = FileManager.default
    guard let url = filemanager.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else{
        return nil
    }
    return url.appendingPathComponent(fileName)
}

//struct for checklists with alll items
struct Checklist: Hashable, Codable {
    var checklist: String = "<unknown>"
    var items: [Items]
}

func getFile() -> URL? {
    let filename = "mychecklists.json"
    let fm = FileManager.default
    guard let url = fm.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else{
        return nil
    }
    return url.appendingPathComponent(filename)
}

//struct for all the checklists
struct DataModel: Codable {
    var checklists: [Checklist]
    
    init(){
        checklists = []
        load()
    }
    
    mutating func load() {
        guard let url = getFile(),
              let data = try? Data(contentsOf: url),
              let datamodel = try?
                JSONDecoder().decode(DataModel.self, from: data)
                    else{
                        self.checklists = testChecklists
                        return
                    }
                    self.checklists = datamodel.checklists
    }
    
    func save() {
        
        guard let url = getFile(),
        let data = try? JSONEncoder().encode(self)
        else{
            return
        }
        try? data.write(to:url)
    }
}

var testChecklists = [Checklist(checklist:"Checklist", items: [Items(item:"Item", checkedStatus: "")])]
