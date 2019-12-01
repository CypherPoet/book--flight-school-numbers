import Foundation


// 📝 Tip: Naming the protocol `ShitcoinType` rather than `Shitcoin`
// allows us to use `Shitcoin` for the associated type in `Price` without
// conflicting with the generic constraint.

public protocol ShitcoinType {
    
    /// The three letter ISO 4217 currency code.
    static var code: String { get }

    
    /// The name of the shitcoin.
    static var name: String { get }
    
    
    
     /// The number of decimal places used to express
     /// any minor units for the shitcoin.
     ///
     /// For example, the US Dollar (USD)
     /// has a minor unit (cents)
     /// equal to 1/100 of a dollar,
     /// and therefore takes 2 decimal places.
     /// The Japanese Yen (JPY)
     /// doesn't have a minor unit,
     /// and therefore takes 0 decimal places.
    static var minorUnit: Int { get }
}
