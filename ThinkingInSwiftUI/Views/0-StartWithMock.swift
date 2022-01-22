import SwiftUI

struct StartWithMockView: View {

    var modelView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(
                """
                struct Model {
                    // An enum of product categories
                    public var category: Category
                    public var price: String
                    public var stocked: Bool
                    public var name: String
                }
                """
            )
        }
        .font(.subheadline.monospaced())
        .padding()
        .background(.thinMaterial)
        .cornerRadius(16)
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Today, we will walkthrough some basics with SwiftUI and breakdown how we may build this feature")
                Text("Let's imagine we have this design with the following model.")
            }
            .padding()
            
            HStack(alignment: .top) {
                modelView
                    .padding(.top) /// Account for ``FilterableProductTable`` padding
                FilterableProductTable()
            }
            .padding(.horizontal)

            Spacer()
        }
        .navigationTitle("Start with a Mock")
    }
}

struct StartWithMockView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                Text("hi")
                StartWithMockView()
            }
            .previewInterfaceOrientation(.landscapeLeft)
            
            StartWithMockView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
