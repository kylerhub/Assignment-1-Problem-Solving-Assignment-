//
//  ContentView.swift
//  AssignmentOne
//
//
//  ContentView.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 14/3/2023.
//
import SwiftUI

//The ContentView struct is the main page for the checklists that navigates to the items of each checklist

struct ContentView: View {
    // model is checklists which can be added and deleted
    @Binding var model: DataModel
    //property myTitle is the title Checklists for all the checklists
    @State var myTitle = "Checklists"
    var body: some View {
        
        NavigationView{
            VStack{
                List {
                    ForEach($model.checklists,id:\.self) {
                        $p in
                        NavigationLink(destination: ListDetailView(checklist: $p, item: [""] )){
                            Text(p.checklist)
                        }
                    }.onDelete { idx in
                        model.checklists.remove(atOffsets: idx)
                    }
                }
            }.navigationTitle(myTitle)
                .navigationBarItems(leading: EditButton(),
                                    trailing: Button("+"){
                    model.checklists.append(Checklist(checklist:"Checklist", items:[]))
                }
                )
        }
    }
}

