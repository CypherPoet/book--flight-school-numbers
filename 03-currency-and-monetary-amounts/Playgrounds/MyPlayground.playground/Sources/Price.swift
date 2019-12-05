import Foundation


public struct Price<S: ShitcoinType> {
    public typealias Shitcoin = S
    
    public var amount: Decimal
    
    
    public init(_ amount: Decimal) {
        self.amount = amount
    }
    
    
    public var shitcoin: ShitcoinType.Type {
        Shitcoin.self
    }
    
    /// A monetary amount rounded to
    /// the number of places of the minor currency unit.
    public var rounded: Self {
        var approximate = self.amount
        var rounded = Decimal()
        
        NSDecimalRound(&rounded, &approximate, Shitcoin.minorUnit, .bankers)
        
        return Price<Shitcoin>(rounded)
    }
}
    
