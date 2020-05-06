//
//  FavouritesView.swift
//  iDine
//
//  Created by Brad Booysen on 7/05/20.
//  Copyright © 2020 Booysenberry. All rights reserved.
//

import SwiftUI

struct FavouritesView: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach(userData.favourites) { item in
                    ItemRow(item: item)
                }
            }
            .navigationBarTitle(Text("Favourites"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    // Create a temporary order instance for preview to work. Replicates the same in scene delegate
    static let data = UserData()
    
    static var previews: some View {
        // Preview doesn't know it's in a navigation view so add it here to see the nav bar in the preview
            FavouritesView().environmentObject(data)
    }
}
