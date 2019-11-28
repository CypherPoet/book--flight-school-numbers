//: [Previous](@previous)

//: ## Cardinal Numbers

//: Linguistically, cardinal numbers are used to denote quantity.
//:
//: A cardinal number can appear as words (one, two, three, four) or as numerals (1, 2, 3, 4).
//:
//: By default, `Number​Formatter` represents numbers with cardinal numerals.
//: This corresponds to the `none` case in the `Number​Formatter.Style` enumeration.
//:
//: You can have a number formatter use cardinal words instead by setting its `number​Style`
//: property to `spell​Out`.


import Foundation



demo(describing: "Cardinal Numbers") {
    let formatter = NumberFormatter()
    
    print(formatter.string(for: 42) ?? "")

    formatter.numberStyle = .spellOut
 
    print(formatter.string(for: 42) ?? "")
    print(formatter.string(for: 42.2) ?? "")
    
    // Italian
    formatter.locale = Locale(identifier: "it")
    
    print(formatter.string(for: 42) ?? "")
    print(formatter.string(for: 42.2) ?? "")
}



demo(describing: "Negative Numbers") {
    let formatter = NumberFormatter()
        
    print(formatter.string(for: -42) ?? "")

    // Swiss German
    formatter.locale = Locale(identifier: "gsw")
    print(formatter.string(for: -42) ?? "")
    
    
    // Arabic
    formatter.locale = Locale(identifier: "ar")
    print(formatter.string(for: -42) ?? "")
}



demo(describing: "Non-Hindu-Arabic Numerals") {
    let formatter = NumberFormatter()

    formatter.locale = Locale(identifier: "ar-SA")
    print(formatter.string(for: 1234567890) ?? "")
}




demo(describing: "Chinese Numerals") {
    let formatter = NumberFormatter()

    formatter.numberStyle = .spellOut
    formatter.locale = Locale(identifier: "zh-Hans")

    print(formatter.string(for: 12345) ?? "")
}

//: [Next](@next)
