//
//  WelcomeView.swift
//  ThinkingInSwiftUI
//
//  Created by William Brandin on 1/24/22.
//

import SwiftUI

struct WelcomeView: View {
    private let url: URL = URL(string: "https://reactjs.org/docs/thinking-in-react.html")!
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("We are all familiar with the world of `UIKit` however `SwiftUI` has caught the world and my Twitter feed by storm. Sometimes our `UIKit` brains can hinder how `SwiftUI` works. Today we will look at a feature and discuss how it can be built using `SwiftUI`.")
                .padding(.horizontal)
            
            Text("This Repo is also public and behind what we will see today, feel free to check it out and see a few tricks!")
                .padding(.horizontal)

            Spacer()
            
            HStack {
                Spacer()
                Text("This talk is inspired by an article called [Thinking in React](https://reactjs.org/docs/thinking-in-react.html) by the React team at _Meta_ (🥸).")
                    .padding()
                    .background(.regularMaterial)
                    .cornerRadius(16)
                    .padding(.horizontal, 72)
                    .padding(.bottom, 32)

                Spacer()
            }
        }
        .navigationTitle("Thinking in SwiftUI")
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("HI")
            WelcomeView()
        }
        .previewInterfaceOrientation(.landscapeLeft)

    }
}
