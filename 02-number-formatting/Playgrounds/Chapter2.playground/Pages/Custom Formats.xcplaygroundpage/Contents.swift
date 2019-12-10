//: [Previous](@previous)

//: ## Custom Formats

import Foundation



//: If none of the built-in `Number​Formatter` styles offer exactly what you’re
//: looking for, you can set a custom number format.
//:
//: The format property takes a valid Number Format Pattern as
//: described inp [Unicode Technical Standard #35 Part 3](https://www.unicode.org/reports/tr35/tr35-numbers.html#Number_Format_Patterns).
    

demo(describing: "Custom Formats") {
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .decimal
    
    // Format with thousands and decimal separator
    // that rounds to the nearest five tenths
    formatter.positiveFormat = "#,##0.5"
    formatter.negativeFormat = "-#,##0.5"
    
    
    formatter.locale = .init(identifier: "en-US")
    
    print(formatter.string(for: 12345.6789) ?? "")
    print(formatter.string(for: -12345.6789) ?? "")
    
    
    formatter.locale = .init(identifier: "fr-FR")
    
    print(formatter.string(for: 12345.6789) ?? "")
    print(formatter.string(for: -12345.6789) ?? "")
}



extension Int {

    func formattedWithAbbreviation() -> String {
        let formatter = NumberFormatter()

        typealias Abbrevation = (threshold:Double, divisor:Double, suffix:String)
        
        let abbreviations: [Abbrevation] = [
            (0, 1, ""),
            (1000.0, 1000.0, "K"),
            (100_000.0, 1_000_000.0, "M"),
            (100_000_000.0, 1_000_000_000.0, "B")
            // you can add more !
        ]
        
        let startValue = Double(abs(self))
        
        let abbreviation: Abbrevation = {
            var prevAbbreviation = abbreviations[0]
            
            for tmpAbbreviation in abbreviations {
                if (startValue < tmpAbbreviation.threshold) {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            
            return prevAbbreviation
        }()
        

        let value = Double(self) / abbreviation.divisor
        
        formatter.positiveSuffix = abbreviation.suffix
        formatter.negativeSuffix = abbreviation.suffix
        formatter.allowsFloats = true
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1

        return formatter.string(for: value)!
    }

}


extension Decimal {
    
    mutating func rounded(toPlaces numberOfPlaces: Int) -> Self {
        var rounded = Decimal()
        
        NSDecimalRound(&rounded, &self, numberOfPlaces, .bankers)
        
        return rounded
    }
}



demo(describing: "Custom Formats with \"K\" and \"M\"") {

    let formatter = NumberFormatter()

    formatter.numberStyle = .spellOut
    formatter.groupingSize = 4

    var thousands = Decimal(12330.1300000000012498210224)
    var millions = Decimal(32_235_230.0007000000012498210224)

    
//    (thousands as NSDecimalNumber).intValue
//    print(Int(truncating: NSDecimalNumber(decimal: thousands)).formattedWithAbbreviation())
    print((thousands.rounded(toPlaces: 2) as NSDecimalNumber).intValue.formattedWithAbbreviation())
    print((millions.rounded(toPlaces: 2) as NSDecimalNumber).intValue.formattedWithAbbreviation())
}

//: [Next](@next)
