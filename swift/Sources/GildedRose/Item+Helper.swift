//
//  Item+Helper.swift
//
//
//  Created by Michelle Ybanez on 6/10/24.
//

import Foundation

extension Item {
    var isLegendary: Bool {
        name == ItemNames.sulfurasHandOfRagnaros
    }
    
    var isBackstagePasses: Bool {
        name == ItemNames.backstagePassesToConcert
    }
    
    // `Quality` of an item is never more than the maximum quality `50`
    var canIncreaseQuality: Bool {
        quality < ItemConstants.maxQuality
    }
}
