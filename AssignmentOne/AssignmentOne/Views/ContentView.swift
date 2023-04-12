//  ContentView.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 14/3/2023.
//
import SwiftUI

//The ContentView struct is the Master View for the checklists that navigates to the items of each checklist
//Importantly, all data now need to be persistent through JSON serialisation.

struct ContentView: View {
    @Binding var model: DataModel
    @State var myTitle = "Checklists"
    
    //you display a Loading indicator, while your data are being loaded.
    @State var isLoading = true
    
    var body: some View {
        NavigationView {
            Group {
                if isLoading {
                    ProgressView("Loading...")
                } else {
                    VStack {
                        List {
                            ForEach($model.checklists, id: \.self) { $p in
                                NavigationLink(
                                    destination: ListDetailView(checklist: $p)
                                ) {
                                    TextField("", text: $p.checklist)
                                }
                            }
                            
                            //Also enable the user to delete an item from the Master Views through a standard swipe gesture (without needing to press Edit first).

                            .onDelete { indices in
                                model.checklists.remove(atOffsets: indices)
                                model.save()
                            }
                            
                            //checklists on the Master View can be re-ordered when in Edit mode
                            
                            .onMove { source, destination in
                                model.checklists.move(fromOffsets: source, toOffset: destination)
                                model.save()
                            }
                        }
                    }
                }
            }
            .navigationTitle(myTitle)
            .navigationBarItems(
                leading:
                    HStack {
                        Button(action: {
                            myTitle = "Checklists"
                        }) {
                            
                            //Make this a fully polished App, ensuring that you have an App icon on the home screen
                            
                            Image(systemName: "house.fill")
                        }
                        EditButton()
                    },
                trailing: Button(action: {
                    model.checklists.append(Checklist())
                    model.save()
                }) {
                    Image(systemName: "plus")
                }
            )
            .onAppear {
                isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isLoading = false
                //this bit saves the items
                model.save()
                }
            }
        }
    }
}
