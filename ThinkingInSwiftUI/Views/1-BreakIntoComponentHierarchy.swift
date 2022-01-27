import SwiftUI

struct BreakIntoComponentsView: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("There seems to be a Hierarchy of these views that we can follow.")
                Text("Without writing code, what components can we already think of?")
                
                Text("When deciding, 'Do I need to create a new component?', it can be beneficial to fallback to the *Single Responsibility Principle*, just as you would a class or function.*")
                
                Text("If necessary, it may be helpful to create a new model for your SwiftUI View. This model and UI should have a similar information architecture, where each component refers to a part of the data model.")
                
                Text("Below, is a breakdown of this component hierarchy and lists out what properties each needs.")
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text("Quick tip!")
                Text("It is recommended that views should be split into components.")
                Text("`VStack`, `HSTack`, and `ZStack` can only have a max of 10 views! ")
            }
            .padding()
            .background(.thinMaterial)
            .cornerRadius(16)
            .padding(.bottom)
            
            VStack {
                /// All of these views seem to have a pattern.
                /// The each have a:
                /// - Color used to denote a particular view
                /// - Formatted title
                /// - Documentation of the particular view
                /// - a Static version of the view itself
                ///
                /// Might be worth exploring how even this could be a new ``View``. 🤔
                ///
                VStack {
                    HStack(alignment: .top) {
                        Color.red.frame(width: 30, height: 30)
                        VStack(alignment: .leading) {
                            Text("`FilterableProductTable`")
                                .bold()
                            Text("This is our main component. Assuming this is running in isolation there should not be any properties.")
                        }
                        Spacer()
                    }
                    
                    StaticFilterableProductTable(bordered: true)
                }
                
                VStack {
                    HStack(alignment: .top) {
                        Color.green.frame(width: 30, height: 30)
                        VStack(alignment: .leading) {
                            Text("`SearchBar`")
                                .bold()
                            Text("The search bar has two properties that it will feed back to it's parent component.")
                            Text("In SwiftUI, because this state is going down `(Parent -> Child)` and back up `(Child -> Parent)` we need to use a binding. We will come back to this later.")

                        }
                        Spacer()
                    }
                    
                    StaticSearchBar(bordered: true)
                        .frame(width: 300)
                }
                
                VStack {
                    HStack(alignment: .top) {
                        Color.purple.frame(width: 30, height: 30)
                        VStack(alignment: .leading) {
                            Text("`ProductTable`")
                                .bold()
                            Text("The product table requires the list as it's input. It also requires the filter text and the `Bool` for whether or not to show out of stock items.")
                        }
                        Spacer()
                    }
                    
                    ProductTable(items: mockedList, bordered: true)
                        .frame(width: 300)
                }
                
                VStack {
                    HStack(alignment: .top) {
                        Color.blue.frame(width: 30, height: 30)
                        VStack(alignment: .leading) {
                            Text("`ProductCategoryRow`")
                                .bold()
                            
                            Text("The only property this component needs is the `Category` in this list section.")
                        }
                        Spacer()
                    }
                    
                    ProductCategoryRow(title: "Sporting Goods", bordered: true)
                        .frame(width: 300)
                }
                
                VStack {
                    HStack(alignment: .top) {
                        Color.orange.frame(width: 30, height: 30)
                        VStack(alignment: .leading) {
                            Text("`ProductRow`")
                                .bold()
                            
                            Text("This row component requires two properties. One for the name of the item and another for the price.")
                        }
                        Spacer()
                    }
                    
                    ProductRow(item: mockedList.first!, bordered: true)
                        .frame(width: 300)
                }
            }
            .padding(.horizontal, 64)
            .padding(.bottom, 64)

            Spacer()
        }
        .navigationTitle("Break Into Components")
    }
}


struct BreakIntoComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                Text("hi")
                BreakIntoComponentsView()
            }
            .previewInterfaceOrientation(.landscapeLeft)
            
            BreakIntoComponentsView()
            .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
