//
//  GildedRose.swift
//
//  A small inn with a prime location in a prominent city ran by a friendly
//  innkeeper named Allison. We also buy and sell only the finest goods.
//  Unfortunately, our goods are constantly degrading in Quality
//  as they approach their sell by date.
//
//  This is the system in place that updates our inventory for us.
//
//  Modified by Michelle Ybanez on 6/10/24.
//
public class GildedRose {
    
    /// The goods in the inventory
    public var items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }

    /// Updates the quality of the items stored in the inventory at the end of each day
    public func updateQuality() {
        items.enumerated().map { index, item in
            var itemToUpdate = item
            itemToUpdate.update()
            items[index] = itemToUpdate
        }
    }
}

extension Item {
    
    /// Updates an item based on certain conditions
    ///
    /// - Parameters:
    ///     - item: The item to be updated
    fileprivate mutating func update() {
        
        // Update quality at the end of each day
        updateQuality()
        
        // Update sell in value at the end of each day
        updateSellIn()
        
        // Update the quality once more when sell in date has passed
        guard sellInDateHasPassed else {
            return
        }
         
        updateQuality()
    }
    
    /// Updates the sell in value for an item
    fileprivate mutating func updateSellIn() {
        // Decrease `sellIn` value at the end of each day except for a legendary item
        if !isLegendary {
            sellIn -= 1
        }
    }
    
    /// Updates the quality for an item based on certain conditions
    fileprivate mutating func updateQuality() {
        // Decrease quality at the end of each day except for `Aged Brie` and `Backstage Passes`
        if !isAgedBrie && !isBackstagePasses {
            decreaseQualityIfNeeded()
            
        // `Quality` drops to `0` after the concert for a `Backstage passes` item
        } else if sellInDateHasPassed, isBackstagePasses {
            quality = 0
            
        // Increase quality the older the item gets if possible
        } else if canIncreaseQuality {
            quality += 1

            // Increase additional quality if needed
            increaseExtraQualityIfNeeded()
        }
    }
    
    /// Increase extra quality for "Backstage passes" items
    /// Like aged brie, increases in `Quality` as its `SellIn` value properties
    fileprivate mutating func increaseExtraQualityIfNeeded() {
        guard !sellInDateHasPassed, isBackstagePasses else {
            return
        }
        
        // `Quality` increases by `2` when there are `10` days or less
        if sellIn < 11, canIncreaseQuality {
            quality += 1
        }

        // `Quality` increases by `3` when there are `5` days or less
        if sellIn < 6, canIncreaseQuality {
            quality += 1
        }
    }
    
    /// Decreases the quality for non-legendary items and for items with quality greater than 0
    fileprivate mutating func decreaseQualityIfNeeded() {
        guard quality > 0, !isLegendary else {
            return
        }
        
        quality -= 1
        
        // "Conjured" items degrade in Quality twice as fast as normal items
        if !sellInDateHasPassed, isConjured {
            quality -= 1
        }
    }
}
