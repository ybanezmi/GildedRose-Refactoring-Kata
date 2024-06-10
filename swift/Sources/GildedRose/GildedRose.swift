public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {
        for index in 0 ..< items.count {
            if items[index].name != "Aged Brie" && items[index].name != "Backstage passes to a TAFKAL80ETC concert" {
                if items[index].quality > 0 {
                    if items[index].name != "Sulfuras, Hand of Ragnaros" {
                        items[index].quality = items[index].quality - 1
                    }
                }
            } else {
                if items[index].quality < 50 {
                    items[index].quality = items[index].quality + 1

                    if items[index].name == "Backstage passes to a TAFKAL80ETC concert" {
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

            if items[index].name != "Sulfuras, Hand of Ragnaros" {
                items[index].sellIn = items[index].sellIn - 1
            }

            if items[index].sellIn < 0 {
                if items[index].name != "Aged Brie" {
                    if items[index].name != "Backstage passes to a TAFKAL80ETC concert" {
                        if items[index].quality > 0 {
                            if items[index].name != "Sulfuras, Hand of Ragnaros" {
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
}
