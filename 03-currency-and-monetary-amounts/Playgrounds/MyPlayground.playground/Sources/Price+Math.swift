import Foundation


// MARK: - Addition
extension Price {
    
    public static func + (lhs: Price<S>, rhs: Price<S>) -> Price<S> {
        Price<S>(lhs.amount + rhs.amount)
    }
    
    public static func += (lhs: inout Price<S>, rhs: Price<S>) {
        lhs = lhs + rhs
    }
}
    

// MARK: - Subtraction
extension Price {
    
    public static func - (lhs: Price<S>, rhs: Price<S>) -> Price<S> {
        Price<S>(lhs.amount - rhs.amount)
    }
    
    public static func -= (lhs: inout Price<S>, rhs: Price<S>) {
        lhs = lhs - rhs
    }
}



// MARK: - Multiplication by scalars
extension Price {
    
    public static func * (price: Price<S>, amount: Decimal) -> Price<S> {
        Price<S>(price.amount * amount)
    }
    
    public static func *= (price: inout Price<S>, amount: Decimal) {
        price = price * amount
    }
    
    
    public static func * (price: Price<S>, amount: Double) -> Price<S> {
        Price<S>(price.amount * Decimal(floatLiteral: amount))
    }
    
    public static func *= (price: inout Price<S>, amount: Double) {
        price = price * amount
    }
    
    
    public static func * (price: Price<S>, amount: Int) -> Price<S> {
        Price<S>(price.amount * Decimal(integerLiteral: amount))
    }
    
    public static func *= (price: inout Price<S>, amount: Int) {
        price = price * amount
    }
}



// MARK: - Negation
extension Price {
    
    public static prefix func - (value: Price<S>) -> Price<S> {
        Price<S>(-value.amount)
    }
}
