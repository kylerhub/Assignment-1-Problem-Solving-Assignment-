//
//  ContentView.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 14/3/2023.
//
import SwiftUI

var tasks = [["Milk","checkmark.circle","Checklist 1"],
                    ["Sugar","",""],
                    ["Bread","",""],
                    ["Cheese","checkmark.circle",""]];

struct ContentView: View {
    @Binding var model: DataModel
    @State var myTitle = "Checklists"
    var body: some View {
        
        NavigationView{
            VStack{
                List {
                    ForEach($model.checklists,id:\.self) {
                        $p in
                        
                        NavigationLink(destination: DetailView(checklist: $p)){
                            Text(p.checklist)
                        }
                    }.onDelete { idx in
                        model.checklists.remove(atOffsets: idx)
                    }
                }
            }
            .navigationTitle(myTitle)
            .navigationBarItems(leading: EditButton(),
                                    trailing: Button("+")
                {
                    model.checklists.append(Checklist(checklist:"New Checklist"))
                }
            )
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
    //static var previews: some View {
        //ContentView()
    //}
//}
