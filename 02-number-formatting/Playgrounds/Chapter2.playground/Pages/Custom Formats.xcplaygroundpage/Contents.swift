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

//: [Next](@next)
