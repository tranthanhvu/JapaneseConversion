//
//  ConversionView.swift
//  JapaneseConversion
//
//  Created by ttvu on 5/5/21.
//

import SwiftUI
import TextView

struct ConversionView: View {
    @State private var charType: JapaneseCharType = JapaneseCharType.hiragana
    
    @State private var charSizeType: JapaneseCharSizeType = JapaneseCharSizeType.both
    
    @State private var input: String = ""
    @State private var isEditing: Bool = false
    @State private var result: String = ""
    
    var body: some View {
        VStack {
            GroupBox(label: Text("Input"), content: {
                TextView(text: $input, isEditing: $isEditing)
                    .background(Color.white)
                    .frame(maxHeight: .infinity)
            })
            
            GroupBox(label: Text("Convert with options"), content: {
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
            })
            
            GroupBox(label: Text("Result"), content: {
                Text(result)
                    .background(Color.white)
                    .frame(maxHeight: .infinity)
            })
        }
    }
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView()
    }
}
