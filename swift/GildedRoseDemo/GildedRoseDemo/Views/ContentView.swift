//
//  ContentView.swift
//  GildedRoseDemo
//
//  Created by Michelle Ybanez on 6/11/24.
//

import SwiftUI
import SwiftData
import GildedRose

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var itemContainers: [ItemContainer]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(itemContainers) { itemContainer in
                    NavigationLink {
                        DetailView(itemContainer: itemContainer)
                    } label: {
                        ListItem(item: itemContainer.item)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = ItemContainer(timestamp: Date(), item: Item(name: "Conjured", sellIn: 80, quality: 80))
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(itemContainers[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ItemContainer.self, inMemory: true)
}
