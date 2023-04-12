//
//  ListDetailView.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 17/3/2023.
//

import SwiftUI

//The ListDetailView struct is the Detail View for the items within each checklist

struct ListDetailView: View {

    @Binding var checklist: Checklist
    
    //ability to interact with the checklist, i.e. tick and untick items, as well as an Edit button that allows deleting items
    
    @State var item = [""]
    
    //resetting the check status of all items (i.e. unchecking all items). Ensure that there is an undo function that restores the status of the ticked-off items to originItem, in case the user hit the Reset button by accident.

    @State var originItem = [""]
    
    @State var myTitle = "Checklist"
    
    var body: some View {
        
        List{
            ForEach($checklist.items, id: \.self) { $pp in
                HStack {
                    Text(pp.item).onTapGesture {
                        if(pp.checkedStatus == "") {
                            pp.checkedStatus = "checkmark.circle"
                            pp.newCheckedStatus = "checkmark.circle"
                        }
                        else if(pp.newCheckedStatus == "checkmark.circle"){
                            pp.newCheckedStatus = ""
                        }
                    }
                    
                    Image(systemName: pp.newCheckedStatus)
                    
                }
                
            }
            .onDelete { idxx in
                checklist.items.remove(atOffsets: idxx)

            }.onMove {indecss, poss in
                checklist.items.move(fromOffsets: indecss, toOffset: poss)
            }
            
        }
        .navigationTitle(myTitle)
            .navigationBarItems(
            leading: EditButton(),
            trailing: Button("+") {
                checklist.items.append(Items(item: "New Item", checkedStatus: "", newCheckedStatus: ""))
            }
            
            )

        // Reset button
                Button("Reset") {
                    //originItem = checklist.items.map { $0.checkedStatus }
                    for index in checklist.items.indices {
                        checklist.items[index].newCheckedStatus = ""
                    }
                }

        // Undo button
                Button("Undo") {
                    for index in checklist.items.indices {
                        checklist.items[index].newCheckedStatus = checklist.items[index].checkedStatus                    }
                }
    }
}
