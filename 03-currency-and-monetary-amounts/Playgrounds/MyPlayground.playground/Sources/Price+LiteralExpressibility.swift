import Foundation


extension Price: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Int) {
        self.init(Decimal(integerLiteral: value))
    }
}


extension Price: ExpressibleByFloatLiteral {
    
    public init(floatLiteral value: Double) {
        self.init(Decimal(floatLiteral: value))
    }
}
