public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {
        for index in 0 ..< items.count {
            updateItem(at: index)
        }
    }
    
    private func updateItem(at index: Int) {
        if items[index].name != ItemNames.agedBrie && items[index].name != ItemNames.backstagePassesToConcert {
            decreaseQualityIfNeededForItem(at: index)
        } else {
            if items[index].quality < 50 {
                items[index].quality = items[index].quality + 1

                increaseExtraQualityIfNeededForItem(item: items[index])
            }
        }

        if items[index].name != ItemNames.sulfurasHandOfRagnaros {
            items[index].sellIn = items[index].sellIn - 1
        }

        if items[index].sellIn < 0 {
            if items[index].name != ItemNames.agedBrie {
                if items[index].name != ItemNames.backstagePassesToConcert {
                    decreaseQualityIfNeededForItem(at: index)
                } else {
                    items[index].quality = items[index].quality - items[index].quality
                }
            } else {
                if items[index].quality < 50 {
                    items[index].quality = items[index].quality + 1
                }
            }
        }
    }
    
    // Increase extra quality for "Backstage passes" items
    // Like aged brie, increases in `Quality` as its `SellIn` value approaches
    private func increaseExtraQualityIfNeededForItem(item: Item) {
        guard item.isBackstagePasses else {
            return
        }
        
        // `Quality` increases by `2` when there are `10` days or less
        if item.sellIn < 11, item.quality < 50 {
            item.quality = item.quality + 1
        }

        // `Quality` increases by `3` when there are `5` days or less
        if item.sellIn < 6, item.quality < 50 {
            item.quality = item.quality + 1
        }
    }
    
    private func decreaseQualityIfNeededForItem(at index: Int) {
        let item = items[index]
        guard item.quality > 0, !item.isLegendary else {
            return
        }
        
        items[index].quality = items[index].quality - 1
    }
}
