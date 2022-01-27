//
//  ContentView.swift
//  ThinkingInSwiftUI
//
//  Created by William Brandin on 1/20/22.
//

import SwiftUI

struct ContentView: View {
    
    var navigationList: some View {
        List {
            NavigationLink("0 - Start with a Mock", destination: StartWithMockView())
            NavigationLink("1 - Break Into Component Hierarchy", destination: BreakIntoComponentsView())
            NavigationLink("2 - Create Static Version", destination: CreateStaticVersionView())
            NavigationLink("3 - Identify State", destination: IdentifyStateView())
            NavigationLink("4- Add State", destination: AddStateView())
        }
        .navigationTitle("Thinking in SwiftUI")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var body: some View {
        NavigationView {
            navigationList
            WelcomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
