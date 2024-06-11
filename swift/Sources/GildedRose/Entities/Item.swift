 //
//  Item.swift
//
//  The goods stored in the Gilded Rose inventory.
//
//  Modified by Michelle Ybanez on 6/10/24.
//
public class Item {
    /// The name of the item
    public var name: String
    
    /// Denotes the number of days the item has to be sold
    public var sellIn: Int
    
    /// Denotes how valuable the item is
    public var quality: Int

    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
}

/// Converts to formatted description
extension Item: CustomStringConvertible {
    public var description: String {
        name + ", " + String(sellIn) + ", " + String(quality)
    }
}

/// Compares the equality of 2 items
extension Item: Equatable {
    public static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.name == rhs.name 
        && lhs.sellIn == rhs.sellIn
        && lhs.quality == rhs.quality
    }
}
