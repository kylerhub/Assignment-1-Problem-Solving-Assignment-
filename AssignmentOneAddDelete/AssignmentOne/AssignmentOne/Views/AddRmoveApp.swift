//
//  AddRmoveApp.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 28/3/2023.
//

import SwiftUI

@main
struct AddRmoveApp: App {
    @State var model:DataModel = DataModel(checklists: testChecklists)
    var body: some Scene {
        WindowGroup {
            ContentView(model: $model)
        }
    }
}
