import SwiftUI

struct CreateStaticVersionView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    private let url: URL = URL(string: "https://github.com/willbrandin/ThinkingInSwiftUI/blob/main/ThinkingInSwiftUI/Views/MasterViews/FilteredListComponents.swift")!
    
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    Text("For now, let's not worry about any data or interactions. Let's just get hard coded elements coded on the screen.")
                    Text("Remembering the components from earlier, we can start by building these out with the properties they need.")
                }
                
                Spacer()
            }
            .padding()
            
            Button(
                action: {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            ) {
                HStack {
                    Image("gitLogo")
                    Text("View on GitHub")
                        .bold()
                        .foregroundColor(colorScheme == .light ? .white : .black)
                }
                .padding(8)
                .padding(.horizontal, 16)
                .background(colorScheme == .light ? .black : .white)
                .cornerRadius(16)
            }
            
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
