//
//  DetailView.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 28/3/2023.
//

import SwiftUI

struct DetailView: View {
    @Binding var checklist: Checklist
    @State var tasks_view: String?
    @State var checkedStatus_view: String?
    var body: some View {
        VStack{
            
        }
            .navigationTitle("Edit checklist")
            .navigationBarItems(leading: EditButton(),
                                 trailing: Button("+")
             {
                checklist.tasks?.append(contentsOf: ["New task"])
             })
    }
}


