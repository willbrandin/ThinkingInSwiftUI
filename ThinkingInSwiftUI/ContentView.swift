//
//  ContentView.swift
//  ThinkingInSwiftUI
//
//  Created by William Brandin on 1/20/22.
//

import SwiftUI

struct ContentView: View {
    
    var welcomeView: some View {
        StartWithMockView()
    }
    
    var navigationList: some View {
        List {
            NavigationLink("0 - Start with a Mock", destination: welcomeView)
            NavigationLink("1 - Break Into Component Hierarchy", destination: BreakIntoComponentsView())
            NavigationLink("2 - Create Static Version", destination: CreateStaticVersionView())
        }
        .navigationTitle("Thinking in SwiftUI")
    }
    
    var body: some View {
        NavigationView {
            navigationList
            welcomeView
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
