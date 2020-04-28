//
//  ContentView.swift
//  iDine
//
//  Created by Brad Booysen on 29/04/20.
//  Copyright © 2020 Booysenberry. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // Get data from json file in bundle
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List {
                // Loop through menu items
                ForEach(menu) { section in
                    
                    // Create sections and section headers
                    Section(header: Text(section.name)) {
                        
                        ForEach(section.items) { item in
                            Text(item.name)
                        }
                    }
                }
            }.navigationBarTitle("Menu") // Set navigation title
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
