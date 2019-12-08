//: [Previous](@previous)

import Foundation



//: By default, `Measurement​Formatter` expresses measurements in terms of the preferred
//: unit for the specified locale.9 But even within a particular locale, our unit
//: preferences may depend on the context. For example, the length of a
//: room may be measured in feet or meters, whereas the distance to
//: the airport may be measured in miles or kilometers.

demo(describing: "Configuring Scale") {
    let lengthOfRoom = Measurement<UnitLength>(value: 8, unit: .meters)
    let distanceToMoon = Measurement<UnitLength>(value: 384_400, unit: .kilometers)
    
    let formatter = MeasurementFormatter()
    
    formatter.unitOptions = .naturalScale
    
    print(formatter.string(from: lengthOfRoom))
    print(formatter.string(from: distanceToMoon))
}


//: When there’s a strong convention for using a particular unit, you
//: may want to override localization preferences.
//:
//: For example, the customary unit of mass for precious metals is troy ounces.
demo(describing: "Displaying the Provided Unit") {
    let ingotMass = Measurement<UnitMass>(value: 100, unit: .ouncesTroy)
    let formatter = MeasurementFormatter()

    print(formatter.string(from: ingotMass))
    
    //: By setting the unit​Options property to include the provided​Unit option,
    //: Measurement​Formatter uses the unit provided by the measurement.
    formatter.unitOptions = .providedUnit
    
    print(formatter.string(from: ingotMass))
}





demo(describing: "Configuring Precision") {
    let barometerReading = Measurement<UnitPressure>(value: 32.23, unit: .inchesOfMercury)
    let pressureInMillibars = barometerReading.converted(to: .millibars)
    
    let formatter = MeasurementFormatter()

    formatter.unitOptions = .providedUnit
    
    print(formatter.string(from: pressureInMillibars))
    
    
    formatter.numberFormatter.usesSignificantDigits = true
    formatter.numberFormatter.maximumSignificantDigits = 3
    
    print(formatter.string(from: pressureInMillibars))
}


demo(describing: "Configuring Temperature Display") {
    let tempInFahrenheit = Measurement<UnitTemperature>(value: 42.2, unit: .fahrenheit)
    let tempInCelsius = Measurement<UnitTemperature>(value: 42.2, unit: .celsius)
    
    let formatter = MeasurementFormatter()
    
    // By default, `MeasurementFormatter` will convert the value and attach
    // the locale's default degree symbol
    print(formatter.string(for: tempInCelsius) ?? "")
    print(formatter.string(for: tempInFahrenheit) ?? "")
    
    
    
    // We could prevent conversion and omit the degree symbol, but that's probably
    // going to everything more confusing 🙂.
    formatter.unitOptions = .temperatureWithoutUnit
    
    print(formatter.string(for: tempInCelsius) ?? "")
    print(formatter.string(for: tempInFahrenheit) ?? "")
}


//: [Next](@next)
