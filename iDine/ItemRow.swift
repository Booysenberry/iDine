//
//  ItemRow.swift
//  iDine
//
//  Created by Brad Booysen on 30/04/20.
//  Copyright © 2020 Booysenberry. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    
    var item: MenuItem
    static let colors: [String:Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        HStack {
            // Bring in the detail view when the row is tapped and pass the item to the next view
            NavigationLink(destination: ItemDetail(item: item)) {
            
            // Add thumbnail image
            Image(item.thumbnailImage)
                .clipShape(Circle()) // Clip to circle shape
                .overlay(Circle().stroke(Color.gray, lineWidth: 2)) // Add circle border
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline) // Change font type
                
                Text("$\(item.price)")
            }
            
            Spacer()
            
            // loop over restrictions and ass to hstack
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(Self.colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {

        ItemRow(item: MenuItem.example)

    }
}
