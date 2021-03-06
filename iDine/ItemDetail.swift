//
//  ItemDetail.swift
//  iDine
//
//  Created by Brad Booysen on 1/05/20.
//  Copyright © 2020 Booysenberry. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    
    var item: MenuItem
    
    @State private var isFavourite = false
    
    //Pass observable objects
    @EnvironmentObject var order: Order
    @EnvironmentObject var favourite: UserData
    
    var body: some View {
        
        VStack {
            
            // Creates overlapping view
            ZStack(alignment: .bottomTrailing) {
                
                Image(item.mainImage)
                
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                
                // add padding around description text
                .padding(25)
            
            // Create button
            Button("Order This") {
                self.order.add(item: self.item) // Add function created in Order.swift
            }.font(.headline)
            
            // Push the content to the top of the view
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
        
        .navigationBarItems(trailing:
            
            // Add favourite button to nav bar
            Button(action: {
                
                self.isFavourite.toggle()
                
                if self.isFavourite {
                    self.favourite.add(item: self.item)
                } else {
                    self.favourite.remove(item: self.item)
                }
                
            }) {
                if isFavourite {
                    Image(systemName: "heart.fill")
                } else {
                    Image(systemName: "heart")
                }
            }
        )
    }
}

struct ItemDetail_Previews: PreviewProvider {
    
    // Create a temporary order instance for preview to work. Replicates the same in scene delegate
    static let order = Order()
    static let data = UserData()
    
    static var previews: some View {
        // Preview doesn't know it's in a navigation view so add it here to see the nav bar in the preview
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
            ItemDetail(item: MenuItem.example).environmentObject(data)
        }
    }
}
