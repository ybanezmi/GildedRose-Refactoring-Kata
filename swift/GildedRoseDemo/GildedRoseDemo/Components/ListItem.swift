//
//  ListItem.swift
//  GildedRoseDemo
//
//  Created by user259831 on 6/11/24.
//

import SwiftUI
import GildedRose

struct ListItem: View {
    let item: Item
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .font(.subheadline)
            Text("Sell in: \(item.sellIn) days, Quality: \(item.quality)")
                .font(.caption)
        }
    }
}

#Preview {
    ListItem(item: Item(name: "Conjured", sellIn: 11, quality: 11))
}
