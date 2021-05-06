//
//  SearchViewModel.swift
//  JapaneseConversion
//
//  Created by ttvu on 5/5/21.
//

import Foundation
import Combine
import UIKit

class SearchViewModel: ObservableObject {
    
    // Input
    @Published var searchText = "だめ"
    @Published var searchType = SearchType.exact
    @Published var sizeType = JapaneseCharSizeType.fullSize
    
    // Output
    @Published private var searchArray: [String] = []
    @Published var content: NSAttributedString = NSAttributedString(string: "だめ ダメ, だめ") 
    
    private var bags = Set<AnyCancellable>()
    
    init() {
        bind()
    }
    
    func bind() {
        Publishers.CombineLatest($content, searchArrPublisher)
            .map({ (source, searchTexts) -> NSAttributedString in
                var result = NSMutableAttributedString(string: source.string)
                
                for item in searchTexts {
                    self.highlight(source: &result, searchText: item)
                }
                
                return result
            })
            .assign(to: \.content, on: self)
            .store(in: &bags)
    }
    
    private var searchArrPublisher: AnyPublisher<[String], Never> {
        Publishers.CombineLatest($searchText, $searchType)
            .map({ (text, type) -> [String] in
                switch type {
                case .exact:
                    return [text]
                case .hiraganaAndkatakana:
                    let convertedHira = text.toHiragana()
                    let convertedKata = text.toKatakana()
                    
                    if convertedHira == convertedKata {
                        return [convertedHira]
                    }
                    
                    return [convertedHira, convertedKata]
                }
            })
            .eraseToAnyPublisher()
    }
    
    func highlight(source: inout NSMutableAttributedString, searchText: String) {
        do {
            let regEx = try NSRegularExpression(pattern: searchText, options: NSRegularExpression.Options.ignoreMetacharacters)
            
            let matchesRanges = regEx.matches(in: source.string, options: [], range: NSMakeRange(0, source.length))

            matchesRanges.forEach { (checkingResult) in
                source.replaceCharacters(
                    in: checkingResult.range,
                    with: NSAttributedString(
                        string: searchText,
                        attributes: [ NSAttributedString.Key.backgroundColor: UIColor.orange]))
            }
        } catch {
            print(error)
        }
    }
    
}
