import Foundation


public struct ShitcoinPair<Fixed: ShitcoinType, Variable: ShitcoinType> {
    public var rate: Decimal
    
    public init(rate: Decimal) {
        precondition(rate > 0)
        self.rate = rate
    }
}

extension ShitcoinPair: BidirectionalShitcoinConverter {}


extension ShitcoinPair: CustomStringConvertible {
    public var description: String {
        "\(Fixed.code) --> \(Variable.code) (Rate: \(rate)"
    }
}
