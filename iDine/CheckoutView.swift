//
//  CheckoutView.swift
//  iDine
//
//  Created by Brad Booysen on 4/05/20.
//  Copyright © 2020 Booysenberry. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    
    // bind picker to a property on the struct to re-invoke the body property if another picker option is selected
    @State private var paymentType = 0
    
    var body: some View {
        
        VStack {
            Section {
                
                // Creates picker
                Picker("How do you want to pay?", selection: $paymentType) {
                    
                    // Loops over paymentTypes array
                    ForEach(0 ..< Self.paymentTypes.count) {
                        
                        // Assigns each item in the array to an option in the picker
                        Text(Self.paymentTypes[$0])
                    }
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
