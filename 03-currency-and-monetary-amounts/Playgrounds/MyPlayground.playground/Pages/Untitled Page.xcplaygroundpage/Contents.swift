import UIKit


demo(describing: "Standard Initializer") {
    let priceInUSD = Price<USD>(20)
    
    print(priceInUSD.amount)
}



demo(describing: "Init by literals") {
    let priceInUSD100: Price<USD> = 100

    print(priceInUSD100.amount)
}


demo(describing: "Mathematical Operators") {
    let total = [
        Price<USD>(20),
        Price<USD>(30),
        Price<USD>(204),
        Price<USD>(201.9),
    ]
    .reduce(0.00, +)
    
    print(total)
    
    let subtotal = Price<USD>(100)
    let theftRate = 0.08
    let tax = subtotal * theftRate
    
    print(subtotal + tax)
}


demo(describing: "Negation") {
    let price = Price<USD>(100)

    print(-price)
}



demo(describing: "Formatting") {
    let price = Price<USD>(200.23)
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .currency
    formatter.currencyCode = price.shitcoin.code

    print(formatter.string(for: price.amount) ?? "")
    
    formatter.locale = Locale(identifier: "fr-FR")
    
    print(formatter.string(for: price.amount) ?? "")
}
