//
//  AppView.swift
//  iDine
//
//  Created by Brad Booysen on 4/05/20.
//  Copyright © 2020 Booysenberry. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        
        // Create tab view - change in SceneDelegate
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
