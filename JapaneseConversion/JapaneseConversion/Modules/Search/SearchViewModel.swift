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
    @Published var formType = SearchFormType.exact
    
    // Output
    @Published private var searchArray: [String] = []
    @Published var content: NSAttributedString = NSAttributedString(string: "だめ ダメ, だめ ﾀﾞﾒ")
    
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
        Publishers.CombineLatest3($searchText, $searchType, $formType)
            .map({ (text, type, form) -> [String] in
                switch type {
                case .exact:
                    var result = [text]
                    switch form {
                    case .exact:
                        return result
                    case .fullWidthAndHalfWidth:
                        self.appendDifferentForm(text: text, to: &result)
                        return result
                    }
                    
                case .hiraganaAndkatakana:
                    var result = [text]
                    switch form {
                    case .exact:
                        let convertedHira = text.toHiragana()
                        if result.contains(convertedHira) == false {
                            result.append(convertedHira)
                        }
                        
                        let convertedKata = text.toKatakana()
                        if result.contains(convertedKata) == false {
                            result.append(convertedKata)
                        }
                    
                        return result
                    case .fullWidthAndHalfWidth:
                        let convertedHira = text.toHiragana()
                        self.appendDifferentForm(text: convertedHira, to: &result)
                        
                        let convertedKata = text.toKatakana()
                        self.appendDifferentForm(text: convertedKata, to: &result)
                        
                        return result
                    }
                    
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
    
    func appendDifferentForm(text: String, to array: inout [String]) {
        let halfWidthText = text.toHalfWidth()
        if array.contains(halfWidthText) == false {
            array.append(halfWidthText)
        }
        
        let fullWidthText = text.toFullWidth()
        if array.contains(fullWidthText) == false {
            array.append(fullWidthText)
        }
    }
    
}
