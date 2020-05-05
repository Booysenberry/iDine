//
//  OrderView.swift
//  iDine
//
//  Created by Brad Booysen on 2/05/20.
//  Copyright © 2020 Booysenberry. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    
    //Pass observable object
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                }.disabled(order.items.isEmpty) // Disable/hide section if order is empty
            }
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton()) // Add edit button to nav bar
        }
    }
    
    // Delete item from order
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    
    // Create a temporary order instance for preview to work. Replicates the same in scene delegate
    static let order = Order()
    
    static var previews: some View {
        // Replicates the same in scene delegate
        OrderView().environmentObject(order)
    }
}
