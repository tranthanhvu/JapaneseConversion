//
//  ConversionViewModel.swift
//  JapaneseConversion
//
//  Created by ttvu on 5/5/21.
//

import Foundation
import Combine

class ConversionViewModel: ObservableObject {
    @Published var inputText = "だめ ダメ, だめ"
    @Published var charType = JapaneseCharType.hiragana
    @Published var sizeType = JapaneseCharSizeType.fullSize
    
    @Published var result = ""
    
    private var bags = Set<AnyCancellable>()
    
    init() {
        bind()
    }
    
    func bind() {
        Publishers.CombineLatest($inputText, $charType)
            .map({ (text, type) -> String in
                switch type {
                case .hiragana:
                    return text.toHiragana()
                case .katakana:
                    return text.toKatakana()
                case .both:
                    return text
                }
            })
            .assign(to: \.result, on: self)
            .store(in: &bags)
    }
}
