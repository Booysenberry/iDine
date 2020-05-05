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
    static let tipAmounts = [10, 15, 20, 25, 0]
    
    // 2-way binding - reinvokes body if data changes
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showpaymentAlert = false
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        
        // Creates a form
        Form {
            
            Section {
                
                // Creates picker. $paymentType = 2 way binding
                Picker("How do you want to pay?", selection: $paymentType) {
                    
                    // Loops over paymentTypes array
                    ForEach(0 ..< Self.paymentTypes.count) {
                        
                        // Assigns each item in the paymentTypes array to an option in the picker
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                // Add toggle and bind to addLoyaltyDetails
                Toggle(isOn: $addLoyaltyDetails) {
                    Text("Add iDine loyalty card")
                }
                
                if addLoyaltyDetails {
                    // Bind input to loyaltyNumber
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            
            // Add new Section and Segmented Picker
            Section(header: Text("Add tip?")) {
                Picker("Percentage", selection: $tipAmount) {
                    
                    // Assigns each item in the tipAmount array to an option in the picker
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            // Add new Section and Button
            Section(header: Text("Total: $\(totalPrice, specifier: "%.2f")")) {
                Button("Confirm Order" ) {
                    
                    // Toggle bool / alert
                    self.showpaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showpaymentAlert) {
            
            // Show alert
            Alert(title: Text("Confirm Order"), message: Text("You total is $\(totalPrice, specifier: "%.2f") - thank you!"), dismissButton: .default(Text("Ok")))
        }
    }
}


struct CheckoutView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
