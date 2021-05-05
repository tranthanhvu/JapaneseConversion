//
//  MainView.swift
//  JapaneseConversion
//
//  Created by ttvu on 5/5/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ConversionView()
                .tabItem {
                    Label("Conversion", systemImage: "arrow.right.arrow.left")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
