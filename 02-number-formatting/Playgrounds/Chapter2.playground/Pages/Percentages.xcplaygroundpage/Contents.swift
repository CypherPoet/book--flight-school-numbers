//: [Previous](@previous)

import Foundation

//: ## Percentages


demo(describing: "Percentages") {
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .percent

    print(formatter.string(for: 0.12345) ?? "")
    
    formatter.positivePrefix = "~"
    formatter.negativePrefix = "~"
//    formatter.positiveSuffix = ")"
//    formatter.negativeSuffix = ")"
    
    formatter.maximumFractionDigits = 2
//    formatter.zeroSymbol = "~0\(formatter.percentSymbol!)"
    
    print(formatter.string(for: 0.12345) ?? "")
    print(formatter.string(for: 0.000012345) ?? "")
    print(formatter.string(for: 0) ?? "")

}

//: [Next](@next)
