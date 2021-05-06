//
//  String+Extension.swift
//  JapaneseConversion
//
//  Created by ttvu on 5/6/21.
//

import Foundation

extension String {
    
//    func toKataKana() -> String {
//        let converted = self.reduce("") { (result, char) -> String in
//            return result + String(char.toKatakana())
//        }
//
//        return converted
//    }
    
    func toKatakana() -> String {
        let str = NSString(string: self)
        let convertedString: CFMutableString = str.mutableCopy() as! CFMutableString
    
        CFStringTransform(convertedString, nil, kCFStringTransformHiraganaKatakana, false)
        
        return String(convertedString)
    }
    
    func toHiragana() -> String {
        let str = NSString(string: self)
        let convertedString: CFMutableString = str.mutableCopy() as! CFMutableString
    
        CFStringTransform(convertedString, nil, kCFStringTransformHiraganaKatakana, true)
        
        return String(convertedString)
    }
    
    func toHalfWidth() -> String {
        let str = NSString(string: self)
        let convertedString: CFMutableString = str.mutableCopy() as! CFMutableString
    
        CFStringTransform(convertedString, nil, kCFStringTransformFullwidthHalfwidth, false)
        
        return String(convertedString)
    }
    
    func toFullWidth() -> String {
        let str = NSString(string: self)
        let convertedString: CFMutableString = str.mutableCopy() as! CFMutableString
    
        CFStringTransform(convertedString, nil, kCFStringTransformFullwidthHalfwidth, true)
        
        return String(convertedString)
    }
}
