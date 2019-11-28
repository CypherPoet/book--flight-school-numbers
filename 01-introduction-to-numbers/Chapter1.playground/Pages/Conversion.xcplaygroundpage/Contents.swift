//: [Previous](@previous)

import Foundation

demo(describing: "Range-Checked and Exact Conversion") {
    let smallUInt8: UInt8 = 4
    let smallUInt16: UInt16 = 4
    
    let largeInt = Int.max
 
    print(UInt16(smallUInt8))
    print(UInt8(smallUInt16))
    
    //: This will crash...
//    print(UInt16(largeInt))
    
    //: If crashing is too dramatic a response to a failed conversion for your tastes, you can instead try exact
    //: conversion using the failable initializer `init?(exactly:`). If the passed value cannot be represented,
    //: the initializer returns `nil`
    print(UInt16(exactly: largeInt))
    print(UInt16(exactly: smallUInt8))
    
    
    //: You can also pass a floating-point number to this initializer
    //: to get an integer value when it is both representable and has
    //: no fractional component.
    
    print(Int8(exactly: 12.0))
    print(Int8(exactly: 12.2)) // nil -- fractional component
//    print(Int8(exactly: 1213.0)) // 🤔 The compiler seems to detect an overflow and crash here
//    print(Int8(exactly: 1213.2)) // 🤔 The compiler seems to detect an overflow and crash here
}



demo(describing: "Clamping Conversion") {
    print(Int8(clamping: 902))
    print(Int8(clamping: -902))
    print(UInt8(clamping: -902))
}


demo(describing: "init(truncatingIfNeeded:)") {
    let baseInt: UInt8 = 240

    print(Int8(truncatingIfNeeded: baseInt))
    print(UInt16(truncatingIfNeeded: baseInt))
}

//: [Next](@next)
