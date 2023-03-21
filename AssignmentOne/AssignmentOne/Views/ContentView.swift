//
//  ContentView.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 14/3/2023.
//
import SwiftUI

var tasks = [["Milk","checkmark.circle"],
                    ["Sugar",""],
                    ["Bread",""],
                    ["Cheese","checkmark.circle"]];

var checklists = [["Checklist 1"],
                  ["Checklist 2"]]

struct ContentView: View {

    var body: some View {
        
        NavigationView{
            VStack{
                List {
                    ForEach(tasks,id:\.self) {task in
                        NavigationLink(destination: ListDetailView(item: task)){
                            ListRowView(item: task)
                        }
                    }
                }
                .navigationTitle("Checklists")
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
