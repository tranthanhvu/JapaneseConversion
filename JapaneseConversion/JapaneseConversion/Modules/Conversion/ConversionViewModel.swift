//
//  ConversionViewModel.swift
//  JapaneseConversion
//
//  Created by ttvu on 5/5/21.
//

import Foundation
import Combine

class ConversionViewModel: ObservableObject {
    
    @Published var inputText = "だめ ダメ, だめ \n ｱ　ア\n゠ ヸ"
    @Published var charType = JapaneseCharType.hiragana
    @Published var formType = JapaneseFormType.fullWidth
    
    @Published var result = ""
    
    private var bags = Set<AnyCancellable>()
    
    init() {
        bind()
    }
    
    func bind() {
        Publishers.CombineLatest3($inputText, $charType, $formType)
            .map({ (text, type, form) -> String in
                switch type {
                case .hiragana:
                    return text.toHiragana()
                case .katakana:
                    switch form {
                    case .fullWidth:
                        return text.toKatakana().toFullWidth()
                    case .halfWidth:
                        return text.toKatakana().toHalfWidth()
                    case .both:
                        return text.toKatakana()
                        
                    }
                case .both:
                    return text
                }
            })
            .assign(to: \.result, on: self)
            .store(in: &bags)
    }
}
