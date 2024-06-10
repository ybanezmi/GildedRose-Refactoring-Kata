public class Item {
    public var name: String
    public var sellIn: Int
    public var quality: Int

    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
}

extension Item: CustomStringConvertible {
    public var description: String {
        name + ", " + String(sellIn) + ", " + String(quality)
    }
}

extension Item: Equatable {
    public static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.name == rhs.name && lhs.sellIn == rhs.sellIn && lhs.quality == rhs.quality
    }
}
