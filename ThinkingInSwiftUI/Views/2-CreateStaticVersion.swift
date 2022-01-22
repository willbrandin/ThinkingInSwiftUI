import SwiftUI

struct CreateStaticVersionView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("For now, let's not worry about any data or interactions. Let's just get hard coded elements coded on the screen.")
                Text("Remembering the components from earlier, we can start by building these out with the properties they need.")
            }
            .padding()
            
            FilterableProductTable()
                .allowsHitTesting(false)
            
            
            
        }
        .navigationTitle("Create Static Version")
    }
}


struct CreateStaticVersionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("hi")
            CreateStaticVersionView()
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}

