//
//  ConversionViewModel.swift
//  JapaneseConversion
//
//  Created by ttvu on 5/5/21.
//

import Foundation
import Combine

class ConversionViewModel: ObservableObject {
    @Published var inputText = ""
    @Published var charType = JapaneseCharType.hiragana
    @Published var sizeType = JapaneseCharSizeType.fullSize
    
    @Published var result = ""
    
    private var bag: AnyCancellable?
    
    init() {
        bind()
    }
    
    func bind() {
        self.bag = Publishers.CombineLatest($inputText, $charType)
            .map({ (text, type) -> String in
                switch type {
                case .hiragana:
                    let count = text.reduce(0) { (total, char) -> Int in
                        if char.isHiragana {
                            return total + 1
                        }
                        
                        return total
                    }
                    
                    return "\(count)"
                case .katakana:
                    let count = text.reduce(0) { (total, char) -> Int in
                        if char.isKatakana {
                            return total + 1
                        }
                        
                        return total
                    }
                    
                    return "\(count)"
                case .both:
                    return text
                }
            })
            .assign(to: \.result, on: self)
    }
}
