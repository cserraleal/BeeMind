//
//  Item.swift
//  BeeMind
//
//  Created by Cristobal Serra on 18/06/25.
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
