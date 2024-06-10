public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    // Updates the quality of the items stored in the Gilded Rose
    public func updateQuality() {
        for item in items {
            update(item: item)
        }
    }
    
    // Updates an item based on certain conditions
    private func update(item: Item) {
        
        // Update quality at the end of each day
        updateQuality(for: item)
        
        // Update sell in value at the end of each day
        updateSellIn(for: item)
        
        // Update the quality once more when sell in date has passed
        guard item.sellInDateHasPassed else {
            return
        }
         
        updateQuality(for: item)
    }
    
    // Updates the sell in value for an item
    private func updateSellIn(for item: Item) {
        // Decrease `sellIn` value at the end of each day except for a legendary item
        if !item.isLegendary {
            item.sellIn -= 1
        }
    }
    
    // Updates the quality for an item based on certain conditions
    private func updateQuality(for item: Item) {
        // Decrease quality at the end of each day except for `Aged Brie` and `Backstage Passes`
        if !item.isAgedBrie && !item.isBackstagePasses {
            decreaseQualityIfNeeded(for: item)
            
        // `Quality` drops to `0` after the concert for a `Backstage passes` item
        } else if item.sellInDateHasPassed, item.isBackstagePasses {
            item.quality = 0
            
        // Increase quality the older the item gets if possible
        } else if item.canIncreaseQuality {
            item.quality += 1

            // Increase additional quality if needed
            increaseExtraQualityIfNeeded(for: item)
        }
    }
    
    // Increase extra quality for "Backstage passes" items
    // Like aged brie, increases in `Quality` as its `SellIn` value approaches
    private func increaseExtraQualityIfNeeded(for item: Item) {
        guard !item.sellInDateHasPassed, item.isBackstagePasses else {
            return
        }
        
        // `Quality` increases by `2` when there are `10` days or less
        if item.sellIn < 11, item.canIncreaseQuality {
            item.quality += 1
        }

        // `Quality` increases by `3` when there are `5` days or less
        if item.sellIn < 6, item.canIncreaseQuality {
            item.quality += 1
        }
    }
    
    // Decreases the quality for non-legendary items and for items with quality greater than 0
    private func decreaseQualityIfNeeded(for item: Item) {
        guard item.quality > 0, !item.isLegendary else {
            return
        }
        
        item.quality -= 1
        
        // "Conjured" items degrade in Quality twice as fast as normal items
        if !item.sellInDateHasPassed, item.isConjured {
            item.quality -= 1
        }
    }
}
