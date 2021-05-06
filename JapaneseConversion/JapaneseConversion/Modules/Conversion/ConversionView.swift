//
//  ConversionView.swift
//  JapaneseConversion
//
//  Created by ttvu on 5/5/21.
//

import SwiftUI
import TextView

struct ConversionView: View {
    @State private var isEditing: Bool = false
    
    @ObservedObject var viewModel = ConversionViewModel()
    
    var body: some View {
        VStack {
            GroupBox(label: Text("Input"), content: {
                TextView(text: $viewModel.inputText, isEditing: $isEditing)
                    .background(Color.white)
                    .frame(maxHeight: .infinity)
            })
            .padding(.all, 10)
            
            GroupBox(label: Text("Convert with options"), content: {
                Picker(selection: $viewModel.charType, label: Text("Picker"), content: {
                    ForEach(JapaneseCharType.allCases, id: \.self) { (type) in
                        Text(type.name).tag(type.rawValue)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                
                Picker(selection: $viewModel.formType, label: Text("Picker"), content: {
                    ForEach(JapaneseFormType.allCases, id: \.self) { (type) in
                        Text(type.name).tag(type.rawValue)
                    }
                })
                .disabled(viewModel.charType != JapaneseCharType.katakana)
                .pickerStyle(SegmentedPickerStyle())
            })
            .padding(.horizontal, 10)
            
            GroupBox(label: Text("Result"), content: {
                Text(viewModel.result)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
            })
            .padding(.all, 10)
        }
    }
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView()
    }
}
