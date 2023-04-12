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
    
    //ability to interact with the checklist, i.e. tick and untick items
    
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
            
            //Also enable the user to delete an item from Detail Views through a standard swipe gesture (without needing to press Edit first).
            
            .onDelete { idxx in
                checklist.items.remove(atOffsets: idxx)

            //checklists on the Detail View can be re-ordered when in Edit mode
                
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

        // resetting the check status of all items (i.e. unchecking all items).
        
                Button("Reset") {
                    for index in checklist.items.indices {
                        checklist.items[index].newCheckedStatus = ""
                    }
                }

        //Ensure that there is an undo function that restores the status of the ticked-off items to originItem, in case the user hit the Reset button by accident.
        
                Button("Undo") {
                    for index in checklist.items.indices {
                        checklist.items[index].newCheckedStatus = checklist.items[index].checkedStatus
                    }
                }
    }
}
