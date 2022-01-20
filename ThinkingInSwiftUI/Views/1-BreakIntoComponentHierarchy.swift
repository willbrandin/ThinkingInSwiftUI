import SwiftUI

struct BreakIntoComponentsView: View {
    
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
                    .foregroundColor(item.stocked ? .primary : .red)
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
                    .foregroundColor(item.stocked ? .primary : .red)
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
                Text("Let's think about a potential hierarchy")
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
        .navigationTitle("Break Into Components")
    }
}


struct BreakIntoComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("hi")
            BreakIntoComponentsView()
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
