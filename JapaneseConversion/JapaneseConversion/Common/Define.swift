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

enum JapaneseFormType: Int, CaseIterable {
    case fullWidth
    case both
    case halfWidth
    
    var name: String {
        switch self {
        case .fullWidth: return "full-width"
        case .both: return "both"
        case .halfWidth: return "half-width"
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
