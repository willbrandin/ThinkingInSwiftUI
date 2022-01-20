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
            NavigationLink("Start with a Mock", destination: StartWithMockView())
        }
    }
    
    var body: some View {
        NavigationView {
            navigationList
            
            VStack {
                Text("Welcome!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
