//
//  ListDetailView.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 17/3/2023.
//

import SwiftUI

struct ListDetailView: View {

    @Binding var checklist: Checklist
    @State var item = [""]
    @State var originItem = [""]
    @State var myTitle = "Checklist"
    
    var body: some View {
        
        List{
            ForEach(checklist.items, id: \.self) { pp in
                HStack {
                    Text(pp.item)
                        .onTapGesture {
                            if(item[0] == "") {
                                item[0] = "checkmark.circle"
                            } else {
                                item[0] = ""
                            }
                        }
                    Image(systemName: item[0])
                }
            }
            .onDelete { idxx in
                checklist.items.remove(atOffsets: idxx)
            }
        }
        .navigationTitle(myTitle)
            .navigationBarItems(
            leading: EditButton(),
            trailing: Button("+") {
               checklist.items.append(Items(item: "Item", checkedStatus: ""))
            }
        )

        //Reset button
        
        Button("Reset"){
            originItem = item
            if(item[0]=="checkmark.circle")
            {item[0]=""}
        }

        Button("Undo") {
            item = originItem
        }
    }
}
