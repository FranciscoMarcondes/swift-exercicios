//
//  Item.swift
//  GestorDespesas
//
//  Created by Francisco Marcondes da Silva Junior on 15/05/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
