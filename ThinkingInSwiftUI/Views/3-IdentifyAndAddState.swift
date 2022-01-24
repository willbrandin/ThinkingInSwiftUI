import SwiftUI

struct IdentifyStateView: View {
  
    var body: some View {
        ScrollView {
            FilterableProductTable()
                .allowsHitTesting(false)
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
