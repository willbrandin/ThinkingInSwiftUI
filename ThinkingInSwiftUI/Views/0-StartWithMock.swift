import SwiftUI

struct StartWithMockView: View {

    var modelView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("struct Model {")
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("// An enum of product categories")
                    Text("public var category: Category")
                }
                Text("public var price: String")
                Text("public var stocked: Bool")
                Text("public var name: String")
            }
            .padding(.leading, 24)
            Text("}")
        }
        .font(.subheadline.monospaced())
        .padding()
        .background(.thinMaterial)
        .cornerRadius(16)
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Let's imagine we have this design with the following model.")
                Text("Today, we will walkthrough some basics with SwiftUI and breakdown how we may build this feature")
                
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
        NavigationView {
            Text("hi")
            StartWithMockView()
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
