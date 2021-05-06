//
//  String+Extension.swift
//  JapaneseConversion
//
//  Created by ttvu on 5/6/21.
//

import Foundation

extension String {
    func toKatakana() -> String {
        let converted = self.reduce("") { (result, char) -> String in
            return result + String(char.toKatakana())
        }
        
        return converted
    }
    
    func toHiragana() -> String {
        let converted = self.reduce("") { (result, char) -> String in
            return result + String(char.toHiragana())
        }
        
        return converted
    }
}
