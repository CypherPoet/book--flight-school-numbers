//: [Previous](@previous)

import Foundation


final class UnitForce: Dimension {
    
    static var newtons: UnitForce {
        let baseUnitConverter = UnitConverterLinear(coefficient: 1)
        
        return .init(symbol: "N", converter: baseUnitConverter)
    }
    
    
    class var kiloNewtons: UnitForce {
        let converter = UnitConverterLinear(coefficient: 1000)
        
        return .init(symbol: "kN", converter: converter)
    }
    
    
    /// 📝 NOTE: Pounds are actually a measure of weight, not mass, and "weight" is actually just
    /// another name for "force".
    ///
    /// When pounds are used as a unit for force, they’re often abbreviated as “lbf” instead of “lb".
    class var pounds: UnitForce {
        let converter = UnitConverterLinear(coefficient: 4.44822)
        
        return .init(symbol: "lbf", converter: converter)
    }
    
    
    override class func baseUnit() -> UnitForce {
        .newtons
    }
}



demo(describing: "Using a custom Dimension") {
    let pw4164Thrust = Measurement<UnitForce>(value: 64_500, unit: .pounds)
    
    print(pw4164Thrust.converted(to: .kiloNewtons))
}



//: [Next](@next)
