//
//  Item+Helper.swift
//
//
//  Created by Michelle Ybanez on 6/10/24.
//

import Foundation

extension Item {
    
    // Determines if item is an aged brie
    var isAgedBrie: Bool {
        name == ItemNames.agedBrie
    }
    
    // Determines if an item is backstage passes to concert
    var isBackstagePasses: Bool {
        name == ItemNames.backstagePasses
    }
    
    // Determines if an item is conjured
    var isConjured: Bool {
        name == ItemNames.conjured
    }
    
    // Determines an item that never has to be sold or decrease in `Quality`
    var isLegendary: Bool {
        name == ItemNames.sulfuras
    }
    
    // `Quality` of an item is never more than the maximum quality `50`
    var canIncreaseQuality: Bool {
        quality < ItemConstants.maxQuality
    }
    
    // Checks if sell date has passed for an item
    var sellInDateHasPassed: Bool {
        sellIn < 0
    }
}
