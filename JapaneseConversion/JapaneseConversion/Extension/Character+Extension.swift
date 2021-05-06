//
//  Character+Extension.swift
//  JapaneseConversion
//
//  Created by ttvu on 5/5/21.
//

import Foundation

extension Character {
    struct Constant {
        static let minKatakana: UInt32 = 0x30a0
        static let maxKatakana: UInt32 = 0x30ff
        static let minHiragana: UInt32 = 0x3040
        static let maxHiragana: UInt32 = 0x309f
        static let minKanji: UInt32 = 0x4e00
        static let maxKnaji: UInt32 = 0x9faf
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
    
    func toKatakana() -> Character {
        if isHiragana,
           let value = self.unicodeScalars.first?.value,
           let scalar = Unicode.Scalar(value - Constant.minHiragana + Constant.minKatakana) {
            return Character(scalar)
        }
        
        return self
    }
    
    func toHiragana() -> Character {
        if isKatakana,
           let value = self.unicodeScalars.first?.value,
           let scalar = Unicode.Scalar(value + Constant.minHiragana - Constant.minKatakana) {
            return Character(scalar)
        }
        
        return self
    }
}
