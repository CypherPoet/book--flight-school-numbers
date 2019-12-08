//: [Previous](@previous)

import Foundation

//: Altitude is often expressed in feet, and vertical airspeed in feet per
//: second.
//:
//: "Feet per second"  doesn’t come standard in `Unit​Speed`, but we can create
//: it ourselves. All we need is the conversion rate and a symbol.


extension UnitSpeed {
    
    class var feetPerSecond: UnitSpeed {
        let converter = UnitConverterLinear(coefficient: 0.00508)
        
        return .init(symbol: "ft/s", converter: converter)
    }
    
}


demo(describing: "Custom Feet-per-second UnitSpeed") {
    let formatter = MeasurementFormatter()
    let verticalAirspeed = Measurement<UnitSpeed>(value: 13.3, unit: .feetPerSecond)
    
    print(formatter.string(for: verticalAirspeed) ?? "")
}

//: [Next](@next)
