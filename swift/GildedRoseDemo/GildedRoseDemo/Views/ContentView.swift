//
//  ContentView.swift
//  GildedRoseDemo
//
//  Created by Michelle Ybanez on 6/11/24.
//

import SwiftUI
import SwiftData
import GildedRose

public struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \ItemContainer.timestamp) private var itemContainers: [ItemContainer]
    
    @StateObject private var viewModel = ContentViewModel()
    @State private var currentDay: Int = 0

    public var body: some View {
        NavigationSplitView {
            HStack {
                Text("Days to simulate: ")
                Spacer()
                TextField(text: $viewModel.simulationDays) {
                    Text("Days to simulate")
                }
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
            }
            .padding(.horizontal, 16)
            
            tabView
            .navigationTitle("Gilded Rose")
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
        .onReceive(viewModel.$simulationDays, perform: { _ in
            viewModel.updateItems(for: viewModel.simulationDays.toIntOrZero,
                                  items: itemContainers.map { $0.item })
        })
    }
    
    @ViewBuilder
    private var tabView: some View {
        TabView(selection: $currentDay) {
            ForEach(viewModel.tabViewModels) { tabViewModel in
                List {
                    HStack {
                        Spacer()
                        Stepper(
                            value: $currentDay, 
                            in: 0...viewModel.simulationDays.toIntOrZero,
                            label: {
                                Text("DAY \(tabViewModel.id)")
                                    .font(.headline)
                            })
                        Spacer()
                    }
                    
                    ForEach(0 ..< tabViewModel.items.count, id: \.self) { index in
                        NavigationLink {
                            DetailView(itemContainer: itemContainers[index])
                        } label: {
                            ListItem(item: tabViewModel.items[index])
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }

    private func addItem() {
        withAnimation {
            let newItem = ItemContainer(
                timestamp: Date(),
                item: Item(
                    name: "Conjured",
                    sellIn: 80,
                    quality: 80))
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
