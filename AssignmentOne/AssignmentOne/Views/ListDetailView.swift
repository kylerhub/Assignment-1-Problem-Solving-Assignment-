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
    
    @State var loading = false // state variable to indicate loading status
    
    var body: some View {
        Group {
            if loading { // show ProgressView if loading is true
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
            } else { // show List if loading is false
                List{
                    ForEach($checklist.items, id: \.self) { $pp in

                        HStack {
                            HStack {
                                TextField("",text: $pp.item)
                            }
                            Text("CheckedStatus").onTapGesture {
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
                .navigationTitle(checklist.checklist)
                            .navigationBarItems(
                            leading: EditButton(),
                            trailing: Button("+") {
                                checklist.items.append(Items(item: "New Item", checkedStatus: "", newCheckedStatus: ""))
                            }
                            
                            )
            }
            
            Button("Reset") {
                for index in checklist.items.indices {
                    checklist.items[index].newCheckedStatus = ""
                }
            }

            Button("Undo") {
                for index in checklist.items.indices {
                    checklist.items[index].newCheckedStatus = checklist.items[index].checkedStatus
                }
            }
        }
        .onAppear {
            // start loading
            loading = true
            // simulate loading delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                // stop loading after delay
                loading = false
            }
        }
    }
}
