//: [Previous](@previous)

import Foundation

//: ## Ordinal Numbers


//: In French, the numeral abbreviation of the word “first” depends on the grammatical
//: gender of the word it describes.
//:
//: For masculine nouns, the suffix is -er (“le 1er jour”), and for feminine nouns,
//: the suffix is -re (“la 1re nuit”). For all other ordinal numbers,
//: the suffix is -e. Number​Formatter only uses the masculine form, -er.

demo(describing: "Indo-European Grammatical Gender") {
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .ordinal
    
    formatter.locale = Locale(identifier: "fr-FR")
    
    print(formatter.string(for: 1) ?? "")
    print(formatter.string(for: 2) ?? "")
    
    formatter.locale = Locale(identifier: "it-IT")
    
    print(formatter.string(for: 1) ?? "")
    print(formatter.string(for: 2) ?? "")
    
    
    //: Warning: Number​Formatter doesn’t provide a way to specify gender, and always uses
    //: the masculine form. To represent ordinal numbers correctly, use NSLocalized​String instead.
}





//: Some languages in the Sino-Tibetan and Altaic language families, including Chinese and Japanese, have
//: nominal classifiers, which specify how a number quantifies something.
//:
//: For example, the Chinese phrase
//: “one ticket”, 「一张票」 (yī zhāng piào), uses the classifier for flat objects, 张, whereas the phrase
//: “one pen”, 「一支笔」 (yī zhī bǐ), uses the classifier for long, round objects, 支.
//:
//:
//: In Japanese, rank or order may be indicated by one of several classifiers — most commonly 第 (だい) or 番 (ばん).
//:
//:
//: Number​Formatter doesn’t provide a way to specify order classifiers, and always uses 第.


demo(describing: "Sino-Tibetan / Altaic Classifiers") {
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .ordinal
    
    formatter.locale = Locale(identifier: "ja-JP")
    
    print(formatter.string(for: 1) ?? "")
    print(formatter.string(for: 2) ?? "")
    print(formatter.string(for: 8) ?? "")
}


//: [Next](@next)
