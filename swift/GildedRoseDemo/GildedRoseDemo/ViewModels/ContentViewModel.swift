//
//  ContentViewModel.swift
//  GildedRoseDemo
//
//  Created by Michelle Ybanez on 6/12/24.
//

import Foundation
import GildedRose

@MainActor
class ContentViewModel: ObservableObject {
    @Published var simulationDays: String = "0"
    @Published var tabViewModels: [TabViewModel] = []
    
    public init() { }
    
    func updateItems(for days: Int, items: [Item]) {
        let gildedRose = GildedRose(items: items)
        tabViewModels = []
        for day in 0 ... days {
            tabViewModels.append(TabViewModel(id: day,
                                              items: gildedRose.items))
            gildedRose.updateQuality()
        }
        
        dump(tabViewModels)
    }
}
