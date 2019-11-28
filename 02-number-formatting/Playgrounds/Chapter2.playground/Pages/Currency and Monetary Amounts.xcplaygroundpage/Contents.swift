//: [Previous](@previous)


//: ## Currency and Monetary Amounts

import Foundation


demo(describing: "Currency and Monetary Amounts") {
    let formatter = NumberFormatter()
    let localeIdentifiers = ["en-US", "en-GB", "de-DE", "ja-JP"]
    let styles: [NumberFormatter.Style] = [
        .currency,
        .currencyAccounting,
        .currencyISOCode,
        .currencyPlural,
    ]
    
    for style in styles {
        formatter.numberStyle = style
        
        for identifier in localeIdentifiers {
            formatter.locale = .init(identifier: identifier)
            
            print(formatter.string(for: 12345.6789) ?? "")
        }
    }
    
    
    //: ### ⚠️ Warning
    //:
    //: Setting `number​Style` to any of the currency styles without explicitly
    //: setting the `currency​Symbol` and/or `currency​Code` properties can produce incorrect results.
}

//: [Next](@next)
