//
//  SearchViewModel.swift
//  JapaneseConversion
//
//  Created by ttvu on 5/5/21.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    // Input
    @Published var searchText = ""
    @Published var charType = JapaneseCharType.hiragana
    @Published var sizeType = JapaneseCharSizeType.fullSize
    
    // Output
    @Published var content = ""
    
    private var bag: AnyCancellable?
    
    init() {
        bind()
    }
    
    func bind() {
        self.bag = $searchText.combineLatest($charType)
            .receive(on: RunLoop.main)
            .sink(receiveValue: { (str, charType) in
                
            })
    }
}
