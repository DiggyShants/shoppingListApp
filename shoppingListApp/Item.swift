//
//  Item.swift
//  shoppingListApp
//
//  Created by Dalton Flanagan on 4/5/2021.
//

import Foundation

class Item: Encodable, Decodable {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
