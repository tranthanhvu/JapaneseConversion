//
//  Character+Extension.swift
//  JapaneseConversion
//
//  Created by ttvu on 5/5/21.
//

import Foundation

extension Character {
    struct Constant {
        static let minKatakana = 0x30a0
        static let maxKatakana = 0x30ff
        static let minHiragana = 0x3040
        static let maxHiragana = 0x309f
        static let minKanji = 0x4e00
        static let maxKnaji = 0x9faf
    }
    
    var isKatakana: Bool {
        if let value = self.unicodeScalars.first?.value {
            return value >= Constant.minKatakana && value <= Constant.maxKatakana
        }
        
        return false
    }
    
    var isHiragana: Bool {
        if let value = self.unicodeScalars.first?.value {
            return value >= Constant.minHiragana && value <= Constant.maxHiragana
        }
        
        return false
    }
    
    var isKanji: Bool {
        if let value = self.unicodeScalars.first?.value {
            return value >= Constant.minKanji && value <= Constant.maxKnaji
        }
        
        return false
    }
}
