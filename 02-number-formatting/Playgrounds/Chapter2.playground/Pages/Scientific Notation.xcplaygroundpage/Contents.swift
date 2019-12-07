//: [Previous](@previous)

//: ## Scientific Notation

import Foundation


demo(describing: "Scientific Notation") {
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .scientific
    

    let gtOne = Decimal(1230.000000000012498210224)
    let ltOne = Decimal(0.000000000012498210224)
    
    print(formatter.string(for: gtOne) ?? "")
    print(formatter.string(for: ltOne) ?? "")
    
    formatter.usesSignificantDigits = true
    
    print(formatter.string(for: gtOne) ?? "")
    print(formatter.string(for: ltOne) ?? "")
    
    formatter.maximumSignificantDigits = 4
    
    print(formatter.string(for: gtOne) ?? "")
    print(formatter.string(for: ltOne) ?? "")
}

//: [Next](@next)
