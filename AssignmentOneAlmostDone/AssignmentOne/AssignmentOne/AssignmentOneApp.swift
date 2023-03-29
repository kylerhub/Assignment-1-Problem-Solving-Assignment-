//
//  AssignmentOneApp.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 16/3/2023.
//

import SwiftUI

@main
struct AssignmentOneApp: App {
    @State var model:DataModel = DataModel(checklists: testChecklists)
    var body: some Scene {
        WindowGroup {
            ContentView(model: $model)
        }
    }
}

import SwiftUI

