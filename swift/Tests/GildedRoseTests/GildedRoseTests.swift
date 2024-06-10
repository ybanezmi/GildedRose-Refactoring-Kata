@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    
    
    private let expectedItemsIn7Days = [
        // Day 1
        [
            Item(name: "+5 Dexterity Vest", sellIn: 9, quality: 19),
            Item(name: "Aged Brie", sellIn: 1, quality: 1),
            Item(name: "Elixir of the Mongoose", sellIn: 4, quality: 6),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 14, quality: 21),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 9, quality: 50),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 4, quality: 50),
            // this conjured item does not work properly yet
            Item(name: "Conjured Mana Cake", sellIn: 2, quality: 5),
        ],
        // Day 2
        [
            Item(name: "+5 Dexterity Vest", sellIn: 8, quality: 18),
            Item(name: "Aged Brie", sellIn: 0, quality: 2),
            Item(name: "Elixir of the Mongoose", sellIn: 3, quality: 5),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 13, quality: 22),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 8, quality: 50),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 3, quality: 50),
            // this conjured item does not work properly yet
            Item(name: "Conjured Mana Cake", sellIn: 1, quality: 4),
        ],
        // Day 3
        [
            Item(name: "+5 Dexterity Vest", sellIn: 7, quality: 17),
            Item(name: "Aged Brie", sellIn: -1, quality: 4),
            Item(name: "Elixir of the Mongoose", sellIn: 2, quality: 4),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 12, quality: 23),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 7, quality: 50),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 2, quality: 50),
            // this conjured item does not work properly yet
            Item(name: "Conjured Mana Cake", sellIn: 0, quality: 3),
        ],
        // Day 4
        [
            Item(name: "+5 Dexterity Vest", sellIn: 6, quality: 16),
            Item(name: "Aged Brie", sellIn: -2, quality: 6),
            Item(name: "Elixir of the Mongoose", sellIn: 1, quality: 3),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 11, quality: 24),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 6, quality: 50),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 1, quality: 50),
            // this conjured item does not work properly yet
            Item(name: "Conjured Mana Cake", sellIn: -1, quality: 1),
        ],
        // Day 5
        [
            Item(name: "+5 Dexterity Vest", sellIn: 5, quality: 15),
            Item(name: "Aged Brie", sellIn: -3, quality: 8),
            Item(name: "Elixir of the Mongoose", sellIn: 0, quality: 2),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 25),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 50),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 50),
            // this conjured item does not work properly yet
            Item(name: "Conjured Mana Cake", sellIn: -2, quality: 0),
        ],
        // Day 6
        [
            Item(name: "+5 Dexterity Vest", sellIn: 4, quality: 14),
            Item(name: "Aged Brie", sellIn: -4, quality: 10),
            Item(name: "Elixir of the Mongoose", sellIn: -1, quality: 0),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 9, quality: 27),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 4, quality: 50),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: -1, quality: 0),
            // this conjured item does not work properly yet
            Item(name: "Conjured Mana Cake", sellIn: -3, quality: 0),
        ],
        // Day 7
        [
            Item(name: "+5 Dexterity Vest", sellIn: 3, quality: 13),
            Item(name: "Aged Brie", sellIn: -5, quality: 12),
            Item(name: "Elixir of the Mongoose", sellIn: -2, quality: 0),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 8, quality: 29),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 3, quality: 50),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: -2, quality: 0),
            // this conjured item does not work properly yet
            Item(name: "Conjured Mana Cake", sellIn: -4, quality: 0),
        ]
    ]
    
    // Test item values within 7 days
    func test7Days() throws {
        let items = [
            Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
            Item(name: "Aged Brie", sellIn: 2, quality: 0),
            Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49),
            // this conjured item does not work properly yet
            Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6),
        ]
        let app = GildedRose(items: items)
        let days = 7
        
        for day in 0 ..< days {
            app.updateQuality()
            print("-------- day \(day + 1) --------")
            XCTAssertEqual(app.items, expectedItemsIn7Days[day])
        }
    }
}
