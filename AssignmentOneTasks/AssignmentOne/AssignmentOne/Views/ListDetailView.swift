//
//  ListDetailView.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 17/3/2023.
//

import SwiftUI

struct ListDetailView: View {

    @Binding var checklist: Checklist
    @State var task: [String]
    @State var originItem = [""]
    @State var myTitle = "Checklist"
    
    var body: some View {
            HStack{
                //Tick and untick
                Text(task[0])
                Image(systemName: task[0])}.onTapGesture {
                    if(task[1]=="")
                    {task[1]="checkmark.circle"}
                    else {task[1]=""}
                }.navigationTitle(myTitle)
                .navigationBarItems(leading: EditButton(),
                                    trailing: Button("+"){
                    checklist.tasks?.append(Tasks(task:"New Task"))
                }
                    //.onAppear{
                    //task = checklist.tasks
                //}
                )
        
                //Edit button
                Button("Edit"){
                    originItem = task
                   if(task[1]=="checkmark.circle")
                    {task[1]=""}
                }
                
                //Undo button
                Button("Undo"){
                    task = originItem
                }
        }
    }


