//
//  ItemContainer.swift
//  GildedRoseDemo
//
//  Created by Michelle Ybanez on 6/11/24.
//

import Foundation
import SwiftData
import GildedRose

@Model
final class ItemContainer {
    var timestamp: Date
    var item: Item
    
    init(timestamp: Date, item: Item) {
        self.timestamp = timestamp
        self.item = item
    }
}
