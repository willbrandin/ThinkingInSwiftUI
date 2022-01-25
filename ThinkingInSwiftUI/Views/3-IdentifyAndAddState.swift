import SwiftUI

struct IdentifyStateView: View {
  
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HStack {
                    Text("According to Apple, our SwiftUI view is a function of our state.")
                    Spacer()
                }
                
                Text("V = f(s)")
                    .font(.body.monospaced())
                    .padding()
                    .background(.regularMaterial)
                    .cornerRadius(16)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("How do we determine what is State?")
                            .font(.title3)
                            .padding(.vertical)
                        Text("Here are a few guidelines for determining if a peice of data is state:")
                        VStack(alignment: .leading) {
                            Text("1. Can this be passed in via a parent View? If so, probably _not_ State.")
                            Text("2. Is it changing? If not, probably _not_ state.")
                            Text("3. Is it possible to compute the data from other state or properties? _Not state_.")
                        }
                        .padding()
                        
                        Text("Let's go through the data in our feature.")
                            .font(.title3)
                            .padding(.vertical)
                        
                        VStack(alignment: .leading) {
                            Text("Our list of products itself does not change. It remains unchanged, we can pass it in via a property. The `SearchBar` and `Toggle (UISwitch`) will change over time and cannot be calculated from other data so these are our state. The list filtering can be computed via this state.")
                        }
                    }
                    
                    Spacer()
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("We can model our state for our view as such:")
                            .padding(.top)
                        
                        HStack {
                            Spacer()

                            Text(
                                """
                                {
                                  filterText: String = ""
                                  showingInStockItems: Bool = false
                                }
                                """
                            )
                            .font(.body.monospaced())
                            .padding()
                            .background(.regularMaterial)
                            .cornerRadius(16)
                            
                            Spacer()
                        }
                        
                        Text("What happens when our state changes? What should it look like with the following state?")
                            .padding(.top)
                        
                        HStack {
                            Spacer()

                            Text(
                                """
                                {
                                  filterText: String = "Baseball"
                                  showingInStockItems: Bool = true
                                }
                                """
                            )
                            .font(.body.monospaced())
                            .padding()
                            .background(.regularMaterial)
                            .cornerRadius(16)
                            
                            Spacer()
                        }
                        
                        Text("We would expect the list to filter out items out of stock, and it should search for 'Baseball'.")
                    }
                    
                    Spacer()
                }
                
            }
            .padding()
            
            FilterableProductTable(text: "Baseball", showingInStockItems: true)
                .padding(.bottom, 64)
        }
        .navigationTitle("Identify and Add State")
    }
}

struct IdentifyStateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("hi")
            IdentifyStateView()
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
