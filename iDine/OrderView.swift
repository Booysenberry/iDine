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
                    }
                }
                
                Section {
                    // Move to CheckoutView
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                }
            }
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
        }
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
