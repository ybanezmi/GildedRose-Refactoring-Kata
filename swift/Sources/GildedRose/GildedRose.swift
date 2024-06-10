public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {
        for index in 0 ..< items.count {
            update(item: items[index])
        }
    }
    
    private func update(item: Item) {
        if !item.isAgedBrie && !item.isBackstagePasses {
            decreaseQualityIfNeeded(for: item)
        } else {
            if item.canIncreaseQuality {
                item.quality = item.quality + 1

                increaseExtraQualityIfNeeded(for: item)
            }
        }

        if !item.isLegendary {
            item.sellIn = item.sellIn - 1
        }

        if item.sellIn < 0 {
            if !item.isAgedBrie {
                if !item.isBackstagePasses {
                    decreaseQualityIfNeeded(for: item)
                } else {
                    item.quality = item.quality - item.quality
                }
            } else {
                if item.canIncreaseQuality {
                    item.quality = item.quality + 1
                }
            }
        }
    }
    
    // Increase extra quality for "Backstage passes" items
    // Like aged brie, increases in `Quality` as its `SellIn` value approaches
    private func increaseExtraQualityIfNeeded(for item: Item) {
        guard item.isBackstagePasses else {
            return
        }
        
        // `Quality` increases by `2` when there are `10` days or less
        if item.sellIn < 11, item.canIncreaseQuality {
            item.quality = item.quality + 1
        }

        // `Quality` increases by `3` when there are `5` days or less
        if item.sellIn < 6, item.canIncreaseQuality {
            item.quality = item.quality + 1
        }
    }
    
    private func decreaseQualityIfNeeded(for item: Item) {
        guard item.quality > 0, !item.isLegendary else {
            return
        }
        
        item.quality = item.quality - 1
    }
}
