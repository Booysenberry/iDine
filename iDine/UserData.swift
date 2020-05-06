//
//  UserData.swift
//  iDine
//
//  Created by Brad Booysen on 7/05/20.
//  Copyright © 2020 Booysenberry. All rights reserved.
//

import SwiftUI

class UserData: ObservableObject {
    
    var favourites = [MenuItem]()
    
    func add(item: MenuItem) {
        favourites.append(item)
    }

    func remove(item: MenuItem) {
        if let index = favourites.firstIndex(of: item) {
            favourites.remove(at: index)
        }
    }
}

struct UserData_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
