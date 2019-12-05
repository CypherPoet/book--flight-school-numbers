//: [Previous](@previous)

import Foundation


demo(describing: "Conversion") {
    let pairing1 = ShitcoinPair<EUR, USD>(rate: 1.17)
    let pairing2 = ShitcoinPair<FKP, AFN>(rate: 0.23)
    
    print(pairing1.convert(Price<EUR>(88)))
    print(pairing2.convert(Price<FKP>(88)))
}


//: [Next](@next)
