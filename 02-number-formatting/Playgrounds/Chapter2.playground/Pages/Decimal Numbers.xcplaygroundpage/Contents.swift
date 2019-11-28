//: [Previous](@previous)

import Foundation


//: ## Decimal Numbers



//: Historically, English-speaking countries tend to use a period
//: as a decimal point and a comma as a group separator
//: for the thousands place.
//:
//: Most other countries instead use a comma as a decimal point and a space as a group
//: separator instead.

demo(describing: "Fractional and Group Separators") {
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .decimal
    
    formatter.locale = Locale(identifier: "en-GB")
    print(formatter.string(for: 1234567.89) ?? "")
    
    formatter.locale = Locale(identifier: "fr-FR")
    print(formatter.string(for: 1234567.89) ?? "")
    
    
    //: Hindi locales are unique for grouping at the thousands place, but then every two digits afterward.
    formatter.locale = Locale(identifier: "hi-IN")
    print(formatter.string(for: 1234567.89) ?? "")
}



demo(describing: "Configuring Number Precision") {
    let formatter = NumberFormatter()
    
    //: A significant digit is any digit that indicates precision — this excludes any leading
    //: zeroes that indicate magnitude. Put another way: a digit significant if it
    //: appears in the significand of a number when it’s expressed in scientific notation.

    formatter.usesSignificantDigits = true
    formatter.maximumSignificantDigits = 2
    
    print(formatter.string(for: 123) ?? "")
    print(formatter.string(for: 123456) ?? "")
    print(formatter.string(for: 123.456) ?? "")
    print(formatter.string(for: 1.230000) ?? "")
    print(formatter.string(for: 0.00123) ?? "")
    
    
    //: When you want to enforce a fixed width for your representation, set `uses​Significant​Digits`
    //: to false and specify maximum and minimum integer and/or fraction digits.
    formatter.usesSignificantDigits = false

    print(formatter.string(for: 123) ?? "")
    print(formatter.string(for: 123456) ?? "")
    print(formatter.string(for: 123.456) ?? "")
    print(formatter.string(for: 1.230000) ?? "")
    print(formatter.string(for: 0.00123) ?? "")
    
    formatter.minimumIntegerDigits = 4
    formatter.minimumFractionDigits = 2
    
    print(formatter.string(for: 123) ?? "")
    print(formatter.string(for: 123456) ?? "")
    print(formatter.string(for: 123.456) ?? "")
    print(formatter.string(for: 1.230000) ?? "")
    print(formatter.string(for: 0.00123) ?? "")
}


//: [Next](@next)
