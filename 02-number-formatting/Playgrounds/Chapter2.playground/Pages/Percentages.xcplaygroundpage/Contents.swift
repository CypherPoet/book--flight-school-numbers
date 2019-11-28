//: [Previous](@previous)

import Foundation

//: ## Percentages


demo(describing: "Percentages") {
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .percent

    
    print(formatter.string(for: 0.12345) ?? "")
}

//: [Next](@next)
