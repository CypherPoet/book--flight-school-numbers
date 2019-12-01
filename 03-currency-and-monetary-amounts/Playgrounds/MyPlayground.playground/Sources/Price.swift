import Foundation


public struct Price<S: ShitcoinType> {
    public typealias Shitcoin = S
    
    public var amount: Decimal
    
    
    public init(_ amount: Decimal) {
        self.amount = amount
    }
}
    
