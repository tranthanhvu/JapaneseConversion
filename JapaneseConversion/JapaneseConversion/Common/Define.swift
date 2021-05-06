//
//  Define.swift
//  JapaneseConversion
//
//  Created by ttvu on 5/5/21.
//

import Foundation

enum JapaneseCharType: Int, CaseIterable {
    case hiragana
    case both
    case katakana
    
    var name: String {
        switch self {
        case .hiragana: return "hiragana"
        case .both: return "both"
        case .katakana: return "katakana"
        }
    }
}

enum JapaneseCharSizeType: Int, CaseIterable {
    case fullSize
    case both
    case halfSize
    
    var name: String {
        switch self {
        case .fullSize: return "full-size"
        case .both: return "both"
        case .halfSize: return "half-size"
        }
    }
}

enum SearchType: Int, CaseIterable {
    case exact
    case hiraganaAndkatakana
    
    var name: String {
        switch self {
        case .exact: return "Exact"
        case .hiraganaAndkatakana: return "Hiragana And Katakana"
        }
    }
}
