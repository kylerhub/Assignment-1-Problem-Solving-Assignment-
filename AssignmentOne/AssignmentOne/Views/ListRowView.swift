//
//  ListRowView.swift
//  AssignmentOne
//
//  Created by jennifer-wei lin on 17/3/2023.
//

import SwiftUI


struct ListRowView: View {
    @State var item: [String]
    var body: some View {
        HStack{
            Text(item[0])
            Image(systemName: item[1])}.onTapGesture {
                if(item[1]==""){
                    item[1]="checkmark.circle"} else {
                        item[1]=""
                }
        }
    }
}

