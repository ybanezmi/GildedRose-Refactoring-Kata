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
}
