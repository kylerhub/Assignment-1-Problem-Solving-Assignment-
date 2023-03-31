//
//  ListDetailView.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 17/3/2023.
//

import SwiftUI

//The ListDetailView struct is for the items within each checklist 

struct ListDetailView: View {

    @Binding var checklist: Checklist
    
    //ability to interact with the checklist, i.e. tick and untick items, as well as an Edit button that allows deleting items
    
    @State var item = [""]
    
    //resetting the check status of all items (i.e. unchecking all items). Ensure that there is an undo function that restores the status of the ticked-off items to originItem, in case the user hit the Reset button by accident.

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
