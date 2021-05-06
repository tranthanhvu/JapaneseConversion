//
//  SearchView.swift
//  JapaneseConversion
//
//  Created by ttvu on 5/5/21.
//

import SwiftUI
import Combine
import TextView

struct SearchView: View {
    @State private var content = "だめ ダメ, だめ"
    @State private var isEditing = false
    
    @ObservedObject var viewModel = SearchViewModel()

    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            GroupBox(label: Text("Search Area"), content: {
                TextField("Search Text", text: $viewModel.searchText)
                    .background(Color.white)
                
                Picker(selection: $viewModel.searchType, label: Text("Picker"), content: {
                    ForEach(SearchType.allCases, id: \.self) { (type) in
                        Text(type.name).tag(type.rawValue)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                
                Picker(selection: $viewModel.sizeType, label: Text("Picker"), content: {
                    ForEach(JapaneseCharSizeType.allCases, id: \.self) { (type) in
                        Text(type.name).tag(type.rawValue)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
            })
            .padding(.all, 10)

            Divider()
            
            AttributedTextView(attributedText: $viewModel.content, isEditing: $isEditing)
                .padding(.all, 10)
        })
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
