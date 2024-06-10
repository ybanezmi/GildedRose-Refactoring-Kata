//
//  Item+Helper.swift
//
//
//  Created by Michelle Ybanez on 6/10/24.
//

import Foundation

extension Item {
    
    var isAgedBrie: Bool {
        name == ItemNames.agedBrie
    }
    
    var isBackstagePasses: Bool {
        name == ItemNames.backstagePasses
    }
    
    var isLegendary: Bool {
        name == ItemNames.sulfuras
    }
    
    // `Quality` of an item is never more than the maximum quality `50`
    var canIncreaseQuality: Bool {
        quality < ItemConstants.maxQuality
    }
    
    var sellInDateHasPassed: Bool {
        sellIn < 0
    }
}
