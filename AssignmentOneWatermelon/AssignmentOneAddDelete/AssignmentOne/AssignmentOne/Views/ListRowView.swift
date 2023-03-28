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
            Text(item[2])
        }
    }
}

