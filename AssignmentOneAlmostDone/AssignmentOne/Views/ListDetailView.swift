//
//  ListDetailView.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 17/3/2023.
//

import SwiftUI

struct ListDetailView: View {
    @State var item: [String]
    @State var originItem = [""]
    var body: some View {
        
            HStack{
                //Tick and untick
                Text(item[0])
                Image(systemName: item[1])}.onTapGesture {
                    if(item[1]=="")
                    {item[1]="checkmark.circle"}
                    else {item[1]=""}
                }.navigationTitle(item[0])
                
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

