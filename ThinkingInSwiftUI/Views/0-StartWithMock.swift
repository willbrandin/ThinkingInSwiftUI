import SwiftUI

struct FinalVersion1View: View {
    
    @State var text: String = ""
    @State var onlyInStock: Bool = false
    
    var list: [Model] {
        var list = mockedList
        
        if !text.isEmpty {
            list = list.filter({ $0.name.lowercased().contains(text.lowercased()) })
        }
        
        if onlyInStock {
            list = list.filter({ $0.stocked })
        }
        
        return list
    }
    
    var body: some View {
        VStack(spacing: 4) {
            TextField("Test", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Toggle("Only show items in stock", isOn: $onlyInStock)
            
            HStack {
                Text("Name")
                    .bold()
                Spacer()
                Text("Price")
                    .bold()
            }
            .padding(.top, 4)
            
            if !list.filter({ $0.category == .sportingGoods }).isEmpty {
                HStack {
                    Text("Sporting Goods")
                        .bold()
                    Spacer()
                }
                
                ForEach(list.filter({ $0.category == .sportingGoods })) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text(item.price)
                    }
                    .foregroundColor(item.stocked ? .primary : .red)
                }
            }
            
            if !list.filter({ $0.category == .electronic }).isEmpty {
                HStack {
                    Text("Electronics")
                        .bold()
                    Spacer()
                }
                
                ForEach(list.filter({ $0.category == .electronic })) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text(item.price)
                    }
                    .foregroundColor(item.stocked ? .primary : .red)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .frame(width: 300)
        .padding()
        .shadow(radius: 3)
    }
}

struct StartWithMockView: View {
    
    var mockView: some View {
        FinalVersion1View()
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Let's imagine we have this design.")
                Spacer()
            }
            .padding()
            
            mockView

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
