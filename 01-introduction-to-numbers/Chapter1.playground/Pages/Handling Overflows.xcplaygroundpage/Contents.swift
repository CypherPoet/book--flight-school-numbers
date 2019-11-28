//: [Previous](@previous)

import Foundation


demo(describing: "Wrap-around arithmetic") {
    //: Swift provides arithmetic operator variants prefixed with an ampersand (&) that
    //: ignore overflow and instead allow values to wrap-around
    
    let maxUInt8 = UInt8.max
    
    print(maxUInt8)
    print(maxUInt8 &+ 1)
    
    // This will crash...
//    maxUInt8 + 1
    
    //: Methods like `adding​Reporting​Overflow(_:)`  report whether overflow occurs by
    //: returning the result along with a Boolean in the tuple return value.
    print(maxUInt8.addingReportingOverflow(1))
    print(maxUInt8.addingReportingOverflow(4))
    print(maxUInt8.addingReportingOverflow(0))
    
    
}






//: [Next](@next)
