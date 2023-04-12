//  ContentView.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 14/3/2023.
//
import SwiftUI

//The ContentView struct is the Master View for the checklists that navigates to the items of each checklist

struct ContentView: View {
    @Binding var model: DataModel
    @State var myTitle = "Checklists"
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
                                    Text(p.checklist)
                                }
                            }
                            .onDelete { indices in
                                model.checklists.remove(atOffsets: indices)
                                model.save()
                            }
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
