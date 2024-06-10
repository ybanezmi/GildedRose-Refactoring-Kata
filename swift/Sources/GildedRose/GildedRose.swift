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
            if items[index].quality > 0 {
                if items[index].name != ItemNames.sulfurasHandOfRagnaros {
                    items[index].quality = items[index].quality - 1
                }
            }
        } else {
            if items[index].quality < 50 {
                items[index].quality = items[index].quality + 1

                if items[index].name == ItemNames.backstagePassesToConcert {
                    if items[index].sellIn < 11 {
                        if items[index].quality < 50 {
                            items[index].quality = items[index].quality + 1
                        }
                    }

                    if items[index].sellIn < 6 {
                        if items[index].quality < 50 {
                            items[index].quality = items[index].quality + 1
                        }
                    }
                }
            }
        }

        if items[index].name != ItemNames.sulfurasHandOfRagnaros {
            items[index].sellIn = items[index].sellIn - 1
        }

        if items[index].sellIn < 0 {
            if items[index].name != ItemNames.agedBrie {
                if items[index].name != ItemNames.backstagePassesToConcert {
                    if items[index].quality > 0 {
                        if items[index].name != ItemNames.sulfurasHandOfRagnaros {
                            items[index].quality = items[index].quality - 1
                        }
                    }
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
}
