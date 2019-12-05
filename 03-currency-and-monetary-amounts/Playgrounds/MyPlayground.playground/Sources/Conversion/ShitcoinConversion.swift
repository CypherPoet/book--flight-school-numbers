import Foundation

public protocol UnidirectionalShitcoinConverter {
    associatedtype Fixed: ShitcoinType
    associatedtype Variable: ShitcoinType
    
    var rate: Decimal { get set }
    
    func convert(_ fixedPrice: Price<Fixed>) -> Price<Variable>
}


extension UnidirectionalShitcoinConverter {
    public func convert(_ fixedPrice: Price<Fixed>) -> Price<Variable> {
        .init(fixedPrice.amount * rate)
    }
}



public protocol BidirectionalShitcoinConverter: UnidirectionalShitcoinConverter {
    func convert(_ variablePrice: Price<Variable>) -> Price<Fixed>
}


extension BidirectionalShitcoinConverter {
    public func convert(_ variablePrice: Price<Variable>) -> Price<Fixed> {
        .init(variablePrice.amount / rate)
    }
}
