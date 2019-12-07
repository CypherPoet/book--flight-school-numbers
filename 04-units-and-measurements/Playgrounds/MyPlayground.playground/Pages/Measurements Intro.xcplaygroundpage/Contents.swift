//: [Previous](@previous)

import Foundation


demo(describing: "Airspeed Converstion") {
    let airspeed = Measurement<UnitSpeed>(value: 124, unit: .knots)
    
    print("\(airspeed.value) knots")
    print("\(airspeed.converted(to: .kilometersPerHour))")
}



//: Measurements with different units can be added and subtracted so long as they all
//: have the same unit type. For example, measurements expressed in kilograms, stones, and
//: pounds can be added together because they all express quantities of mass.


demo(describing: "Adding and Subtracting Like Units") {
    let weight1 = Measurement<UnitMass>(value: 100, unit: .kilograms)
    let weight2 = Measurement<UnitMass>(value: 100, unit: .pounds)
    let weight3 = Measurement<UnitMass>(value: 100, unit: .stones)
    
    print((weight1).converted(to: .metricTons))
    print((weight1 + weight2).converted(to: .metricTons))
    print((weight1 + weight2 + weight3).converted(to: .metricTons))
}


func * (
    lhs: Measurement<UnitLength>,
    rhs: Measurement<UnitLength>
) -> Measurement<UnitArea> {
    .init(
        value: lhs.value * rhs.converted(to: lhs.unit).value,
        unit: UnitArea.baseUnit()
    )
}


demo(describing: "Custom Overloads for Unit Arithmetic") {
    let widthInfeet = Measurement<UnitLength>(value: 100, unit: .feet)
    let heightInMeters = Measurement<UnitLength>(value: 235.2, unit: .meters)

    print(widthInfeet * heightInMeters)
}





//: [Next](@next)
