import SwiftUI

struct CreateStaticVersionView: View {
    
    var mockView: some View {
        VStack(spacing: 4) {
            VStack {
                TextField("Test", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Toggle("Only show items in stock", isOn: .constant(false))
            }
            .border(.green)
            
            VStack(spacing: 4) {
                HStack {
                    Text("Name")
                        .bold()
                    Spacer()
                    Text("Price")
                        .bold()
                }
                .padding(.top, 4)
                
                HStack {
                    Text("Sporting Goods")
                        .bold()
                    Spacer()
                }
                .border(.blue)
                
                ForEach(mockedList.filter({ $0.category == .sportingGoods })) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text(item.price)
                    }
                    .border(.orange)
                }
                
                HStack {
                    Text("Electronics")
                        .bold()
                    Spacer()
                }
                .border(.blue)
                
                ForEach(mockedList.filter({ $0.category == .electronic })) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text(item.price)
                    }
                    .border(.orange)

                }
            }
            .border(.purple)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .frame(width: 300)
        .border(.red)

        .padding()
        .shadow(radius: 3)
    }
    
    var body: some View {
        ScrollView {
            HStack {
                Text("For now, let's not worry about any data or interactions. Let's just get hard coded elements coded on the screen.")
                Spacer()
            }
            .padding()
            
            mockView

            VStack {
                HStack {
                    Color.red.frame(width: 30, height: 30)
                    Text("FilterableProductTable")
                        .bold()
                    Spacer()
                }
                
                HStack {
                    Color.green.frame(width: 30, height: 30)
                    Text("SearchBar")
                        .bold()
                    Spacer()
                }
                
                HStack {
                    Color.purple.frame(width: 30, height: 30)
                    Text("ProductTable")
                        .bold()
                    Spacer()
                }
                
                HStack {
                    Color.blue.frame(width: 30, height: 30)
                    Text("ProductCategoryRow")
                        .bold()
                    Spacer()
                }
                
                HStack {
                    Color.orange.frame(width: 30, height: 30)
                    Text("ProductRow")
                        .bold()
                    Spacer()
                }
            }
            .padding(.horizontal, 64)
            
            Spacer()
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

