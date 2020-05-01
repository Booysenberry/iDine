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
                .padding()
            
            // Push the content to the top of the view
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        // Preview doesn't know it's in a navigation view so add it here to see the nav bar in the preview
        NavigationView {
        ItemDetail(item: MenuItem.example)
        }
    }
}
