//
//  SearchView.swift
//  JapaneseConversion
//
//  Created by ttvu on 5/5/21.
//

import SwiftUI
import TextView

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

struct SearchView: View {
    @State private var searchText: String = "hih"
    @State private var charType: JapaneseCharType = JapaneseCharType.hiragana
    @State private var charSizeType: JapaneseCharSizeType = JapaneseCharSizeType.both
    
    @State private var content = "だめ ダメ"
    @State private var isEditing = false

    
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            GroupBox {
                HStack(alignment: .center, spacing: nil, content: {
                    Text("Search Text")
                        .padding(.all, 10)
                    
                    TextField("", text: $searchText)
                })
                
                
                Picker(selection: $charType, label: Text("Picker"), content: {
                    ForEach(JapaneseCharType.allCases, id: \.self) { (type) in
                        Text(type.name).tag(type.rawValue)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                
                Picker(selection: $charSizeType, label: Text("Picker"), content: {
                    ForEach(JapaneseCharSizeType.allCases, id: \.self) { (type) in
                        Text(type.name).tag(type.rawValue)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.all, 10)

            Divider()
            
            TextView(text: $content, isEditing: $isEditing)
                .padding(.all, 10)
        })
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
