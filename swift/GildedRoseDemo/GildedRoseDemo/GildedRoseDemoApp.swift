//
//  GildedRoseDemoApp.swift
//  GildedRoseDemo
//
//  Created by Michelle Ybanez on 6/11/24.
//

import SwiftUI
import SwiftData
import GildedRose

@main
struct GildedRoseDemoApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ItemContainer.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
    
    init() {
        do {
            let descriptor = FetchDescriptor<ItemContainer>()
            guard try sharedModelContainer.mainContext.fetchCount(descriptor) == 0 else {
                return
            }
            
            let preloadItems = [
                ItemContainer(timestamp: Date(), item: Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20)),
                ItemContainer(timestamp: Date(), item: Item(name: "Aged Brie", sellIn: 2, quality: 0)),
                ItemContainer(timestamp: Date(), item: Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7)),
                ItemContainer(timestamp: Date(), item: Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)),
                ItemContainer(timestamp: Date(), item: Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80)),
                ItemContainer(timestamp: Date(), item: Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20)),
                ItemContainer(timestamp: Date(), item: Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49)),
                ItemContainer(timestamp: Date(), item: Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49)),
                ItemContainer(timestamp: Date(), item: Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6)),
            ]
            
            for item in preloadItems {
                sharedModelContainer.mainContext.insert(item)
            }
        } catch {
            // Do nothing
        }
    }
}
