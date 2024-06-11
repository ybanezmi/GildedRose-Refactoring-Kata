//
//  DetailView.swift
//  GildedRoseDemo
//
//  Created by Michelle Ybanez on 6/11/24.
//

import SwiftUI
import GildedRose

struct DetailView: View {
    let itemContainer: ItemContainer
    
    var body: some View {
        VStack {
            Text(itemContainer.item.name)
            Text("Sell in: \(itemContainer.item.sellIn) days, Quality: \(itemContainer.item.quality)")
            Text("\(itemContainer.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                .font(.caption)
        }
    }
}

#Preview {
    DetailView(
        itemContainer: ItemContainer(timestamp: Date(),
                                     item: Item(name: "Conured",
                                                sellIn: 11,
                                                quality: 11)))
}
