//: [Previous](@previous)


//: ## Using `for` vs `from` as a NumberFormatter argument

import Foundation


demo(describing: "Using `for` vs `from` as a NumberFormatter argument") {
    let formatter = NumberFormatter()
    formatter.numberStyle = .scientific
    
    let number = 443189.13
    
    print(formatter.string(for: number) ?? "")
    print(formatter.string(from: number as NSNumber) ?? "")
    
    
    // 🔑 There's not much difference between these two now WRT Swift. I prefer
    // `string(for:)` since it avoids casting kludgyness 🙂
}

//: [Next](@next)
    