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
             ["Cheese","checkmark.circle"]]
struct ContentView: View {
    var body: some View {
        
        NavigationView{
            List {
                ForEach(tasks,id:\.self) { task in
                    ListRowView(item: task)
                }
            }
            .navigationTitle("Groceries")
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ListRowView: View {
    var item: [String]
    var body: some View {
        HStack{
            Text(item[0])
            Image(systemName: item[1])
        }
    }
}
