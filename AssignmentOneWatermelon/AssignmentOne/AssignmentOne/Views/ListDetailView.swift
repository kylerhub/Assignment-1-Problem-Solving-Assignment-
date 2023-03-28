//
//  ListDetailView.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 17/3/2023.
//

import SwiftUI

struct ListDetailView: View {

    @Binding var checklist: Checklist
    @State var item: [String]
    @State var originItem = [""]
    @State var myTitle = "Checklist"
    
    var body: some View {
        HStack{
            List{
                ForEach(checklist.items,id:\.self){
                    pp in Text(pp.item)
                }.onDelete
                    { idx in checklist.items.remove(atOffsets: idx)
                    }
                }
            
                //Tick and untick
                Text(item[0])
                Image(systemName: item[0])}.onTapGesture {
                    if(item[1]=="")
                    {item[1]="checkmark.circle"}
                    else {item[1]=""}
                
                }.navigationTitle(myTitle)
                .navigationBarItems(leading: EditButton(),
                                    trailing: Button("+"){
                    checklist.items.append(Items(item:"New Item"))
                }
                    //.onAppear{
                    //task = checklist.tasks
                //}
                )
        
                //Edit button
                Button("Edit"){
                    originItem = item
                   if(item[1]=="checkmark.circle")
                    {item[1]=""}
                }
                
                //Undo button
                Button("Undo"){
                    item = originItem
                }
        }
    }


