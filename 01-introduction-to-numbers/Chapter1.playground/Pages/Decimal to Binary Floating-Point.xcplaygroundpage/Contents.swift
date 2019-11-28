//: [Previous](@previous)

//: ## Converting from Decimal to Binary Floating-Point

import Foundation

let baseNumber = 0.0765


// Derive the bitPattern: http://cstl-csm.semo.edu/xzhang/Class%20Folder/CS280/Workbook_HTML/FLOATING_tut.htm
let bitPattern: UInt32 = 0b00111101100111001010110000001000

let bitString = String(bitPattern, radix: 2, uppercase: false)
let paddedString = String(repeating: "0", count: 32 - bitString.count) + bitString

print(paddedString)
print(paddedString == "00111101100111001010110000001000")

print(Float(bitPattern: bitPattern) == Float(baseNumber))

//: [Next](@next)
