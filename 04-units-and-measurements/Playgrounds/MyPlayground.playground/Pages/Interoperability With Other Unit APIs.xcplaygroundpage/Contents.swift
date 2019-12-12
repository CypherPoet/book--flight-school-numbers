//: [Previous](@previous)

import Foundation



extension Measurement where UnitType == UnitDuration {

    /// Enables the usage of `TimeInterval` for Measurements
    init(timeInterval: TimeInterval) {
        self.init(value: timeInterval, unit: .seconds)
    }
    
    
    /// Enables the usage of `DateInterval` for Measurements
    init(dateInterval: DateInterval) {
        self.init(timeInterval: dateInterval.duration)
    }
}



//: We have to be picky when converting `Date​Components` to a measure of duration.
//: If there are any components other than nanoseconds, seconds, minutes, or hours,
//: it’s impossible to determine an absolute duration.
//:
//: We can enforce this by throwing an error or by simply making the initializer optional.

extension Measurement where UnitType == UnitDuration {
    
    init?(dateComponents: DateComponents) {
        guard
            dateComponents.era == nil,
            dateComponents.year == nil,
            dateComponents.month == nil,
            dateComponents.day == nil,
            dateComponents.weekday == nil,
            dateComponents.weekdayOrdinal == nil,
            dateComponents.weekOfYear == nil,
            dateComponents.weekOfMonth == nil,
            dateComponents.yearForWeekOfYear == nil
        else {
            return nil
        }
        
        let nanoseconds = Measurement<UnitDuration>(
            value: Double(dateComponents.nanosecond ?? 0),
            unit: .nanoseconds
        )
        
        let seconds = Measurement<UnitDuration>(
            value: Double(dateComponents.second ?? 0),
            unit: .seconds
        )
        
        let minutes = Measurement<UnitDuration>(
            value: Double(dateComponents.minute ?? 0),
            unit: .minutes
        )
        
        let hours = Measurement<UnitDuration>(
            value: Double(dateComponents.hour ?? 0),
            unit: .hours
        )
        
        let total = nanoseconds + seconds + minutes + hours

        print(total.unit)
        self.init(value: total.value, unit: total.unit)
    }
}


demo(describing: "Measurments from `DateComponents`") {
    let components = DateComponents(hour: 4, minute: 22, second: 3, nanosecond: 23508)
    let measurement = Measurement<UnitDuration>(dateComponents: components)
    
    print(measurement?.converted(to: .hours) ?? "")
    print(measurement?.converted(to: .minutes) ?? "")
    print(measurement?.converted(to: .nanoseconds) ?? "")
    
}


//: Calendar units can be a convinent way to express relative time -- and DateComponentsFormatter
//: can help when that time is held inside of a `Measurement<UnitDuration` instance

extension DateComponentsFormatter {
    
    func string(from duration: Measurement<UnitDuration>) -> String? {
        
        // 🔑 The `modf` function returns a tuple containing the integer and
        // fraction components of a floating point number.
        let (seconds, fractionsOfASecond) = modf(duration.converted(to: .seconds).value)
        let nanoseconds = fractionsOfASecond * 1000000000
        
        let dateComponents = DateComponents(second: Int(seconds), nanosecond: Int(nanoseconds))
        
        return self.string(from: dateComponents)
    }
}


demo(describing: "Using DateComponentsFormatter on UnitDuration measurements") {
    let formatter = DateComponentsFormatter()
    let dateComponents = DateComponents(second: 3, nanosecond: 23508)
    let measurement = Measurement<UnitDuration>(dateComponents: dateComponents)!
    
    print(formatter.string(from: measurement) ?? "")
    print(formatter.string(from: dateComponents) ?? "")
 
    
    let loggedFlyingTime = Measurement<UnitDuration>(value: 220, unit: .hours)
    formatter.allowedUnits = [.day]
    formatter.unitsStyle = .full
    formatter.includesApproximationPhrase = true
    
    print(formatter.string(from: loggedFlyingTime) ?? "")
}


//: The first iteration of Foundation’s units and measurement
//: APIs came in iOS 8 and macOS 10.10, with Length​Formatter, Mass​Formatter, and Energy​Formatter.
//:
//: They were useful in their time, but Measurement​Formatter has since
//: rendered them obsolete. If you have code that uses these
//: legacy APIs, bridging the formatter unit types to the corresponding
//: Dimension is as simple as writing a switch statement.

extension UnitMass {
    
    convenience init(_ massFormatterUnit: MassFormatter.Unit) {
        var unit: UnitMass
        
        switch massFormatterUnit {
        case .gram:
            unit = .grams
        case .kilogram:
            unit = .kilograms
        case .ounce:
            unit = .ounces
        case .pound:
            unit = .pounds
        case .stone:
            unit = .stones
        }
        
        self.init(symbol: unit.symbol, converter: unit.converter)
    }
    
    
    convenience init(_ lengthFormatterUnit: LengthFormatter.Unit) {
        var unit: UnitLength
        
        switch lengthFormatterUnit {
        case .millimeter:
            unit = .millimeters
        case .centimeter:
            unit = .centimeters
        case .meter:
            unit = .meters
        case .kilometer:
            unit = .kilometers
        case .inch:
            unit = .inches
        case .foot:
            unit = .feet
        case .yard:
            unit = .yards
        case .mile:
            unit = .miles
        }
        
        self.init(symbol: unit.symbol, converter: unit.converter)
    }
}


import CoreLocation

extension Measurement where UnitType == UnitSpeed {
    
    init(clLocationSpeed: CLLocationSpeed) {
        self.init(value: clLocationSpeed, unit: .metersPerSecond)
    }
}


extension Measurement where UnitType == UnitAngle {

    init(clLocationDegrees: CLLocationDegrees) {
        self.init(value: clLocationDegrees, unit: .degrees)
    }
    
    init(clLocationDirection: CLLocationDirection) {
        self.init(value: clLocationDirection, unit: .degrees)
    }
}


extension Measurement where UnitType == UnitLength {

    init(clLocationAccuracy: CLLocationAccuracy) {
        self.init(value: clLocationAccuracy, unit: .meters)
    }
    
    init(clLocationDistance: CLLocationDistance) {
        self.init(value: clLocationDistance, unit: .meters)
    }
}


//: [Next](@next)

