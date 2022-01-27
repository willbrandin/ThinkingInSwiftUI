//
//  4-AddState.swift
//  ThinkingInSwiftUI
//
//  Created by William Brandin on 1/27/22.
//

import SwiftUI

struct AddStateView: View {
    @State var isStateSheetPresented: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                VStack(alignment: .leading) {
                    Text("In SwiftUI, there have a few tools we can use to add our state. Each one differs slightly but has it's own use case. These are property wrappers that tell SwiftUI to re-render your View when their value changes.")
                    
                    Button("Let's see", action: { isStateSheetPresented = true })
                        .padding()
                }
                .sheet(isPresented: $isStateSheetPresented) {
                    NavigationView {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("1. Use `@State` when your view only mutates it's own properties.")
                                Text("2. Use `@Binding` when your view needs to mutate data passed in via a parent")
                                Text("3. Use `@ObservedObject` when your view is dependent on an `ObservableObject` subclass. ie. `ViewModel`")
                                Text("4. `@StateObject` is similar to `@ObservedObject` however a re-render does not create a new instance of the object.")
                                Text("4. `@EnvironmentObject` allows you to pass an `ObservableObject` down your component tree via a property wrapper.")
                                Text("There are more property wrappers that serve more specific purposes but are not relevant to this chit chat. ")
                                    .italic()
                            }
                            .padding()
                        }
                        .navigationTitle("SwiftUI State Property Wrappers")
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Back to our Feature")
                        .font(.title2)
                    Text("For our feature we will use `@State` because we do not have to mutate an ancestor we have no objects to pass in.")
                    
                    Text("In `FilterableProductTable` we will prefix our properties with `@State`.")
                    
                    HStack {
                        Spacer()
                        Text(
                        """
                        @State private var text: String = ""
                        @State private var showingInStockItems: Bool = false
                        """
                        )
                            .font(.body.monospaced())
                            .padding()
                            .background(.regularMaterial)
                            .cornerRadius(16)
                        
                        Spacer()
                    }
                    .padding(.vertical)
                    
                    Text("Note: We add private because accessing `@State` outside of this View can cause a crash 🤯")
                        .font(.caption)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Search Bar")
                            .font(.title3)
                        
                        Text("Because `SearchBar` needs to mutate the state from above, we need to pass in a `Binding`.")
                        
                        HStack {
                            Spacer()
                            Text(
                                """
                                @Binding var text: String
                                @Binding var showingInStockItems: Bool
                                """
                            )
                            .font(.body.monospaced())
                            .padding()
                            .background(.regularMaterial)
                            .cornerRadius(16)
                            
                            Spacer()
                        }
                        .padding(.vertical)
                        
                        Text("Because the value of a binding is controlled by it's parent view, we do not initialize them with default values. ")
                        
                        Text("We will also need to update our `FilterableProductTable` view to initialize the `SearchBar` with bindings. We prefix the passed in value with a `$`")
                        
                        HStack {
                            Spacer()
                            Text(
                            """
                            SearchBar(text: $text, showingInStockItems: $showingInStockItems)
                            """
                            )
                                .font(.body.monospaced())
                                .padding()
                                .background(.regularMaterial)
                                .cornerRadius(16)
                            
                            Spacer()
                        }
                        .padding(.vertical)
                    }
                    .padding(.top)
                                        
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Product List")
                            .font(.title3)
                        
                        Text("If you go ahead and run the app the `SearchBar` is now functional. But what may be a surprise is that our `ProductTable` is updating as well! Why does this happen? Let's walk through what happens when you tap the `Toggle` in the `SearchBar`.")
                        
                        HStack {
                            Spacer()
                            FilterableProductTable()
                            Spacer()
                        }
                        .padding()
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("1. Turning on the `Toggle` passes `true` to the `@Binding` property `showingInStockItems`.")
                            Text("2. This changes the `@State` propery `showingInStockItems` to `true` inside of `FilterableProductTable`.")
                            Text("3. SwiftUI will trigger a re-render of `FitlerableProductTable` with these new values.")
                            Text("4. Because the `SearchBar` binding is now `true` the toggle appears turned on.")
                            Text("5. The `ProductTable` view re-renders however this time `showingInStockItems` is `false`. On line, `54` we filter based on this flag.")
                            Text("6. With the list filtering taking place, we can verify that this feature is complete!")
                        }
                    }
                    
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 64)
        }
        .navigationTitle("Add State")
    }
}

struct AddStateView_Previews: PreviewProvider {
    static var previews: some View {
        AddStateView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
