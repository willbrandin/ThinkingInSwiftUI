import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var showingInStockItems: Bool
    
    var bordered: Bool = false
    
    var body: some View {
        VStack {
            TextField("Filter", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Toggle("Only show items in stock", isOn: $showingInStockItems)
        }
        .border(bordered ? .green : .clear)
    }
}

struct ProductRow: View {
    var item: Model
    var bordered: Bool = false

    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            Text(item.price)
        }
        .foregroundColor(item.stocked ? .primary : .red)
        .border(bordered ? .orange : .clear)
    }
}

struct ProductCategoryRow: View {
    var title: String
    var bordered: Bool = false

    var body: some View {
        HStack {
            Text(title)
                .bold()
            Spacer()
        }
        .border(bordered ? .blue : .clear)
    }
}

struct ProductTable: View {
    var items: [Model] = []
    var bordered: Bool = false

    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text("Name")
                    .bold()
                Spacer()
                Text("Price")
                    .bold()
            }
            .padding(.top, 4)
            
            if !items.filter({ $0.category == .sportingGoods }).isEmpty {
                ProductCategoryRow(title: "Sporting Goods", bordered: bordered)
                ForEach(items.filter({ $0.category == .sportingGoods })) { item in
                    ProductRow(item: item, bordered: bordered)
                }
            }
            
            if !items.filter({ $0.category == .electronic }).isEmpty {
                ProductCategoryRow(title: "Electronics", bordered: bordered)
                ForEach(items.filter({ $0.category == .electronic })) { item in
                    ProductRow(item: item, bordered: bordered)
                }
            }
        }
        .border(bordered ? .purple : .clear)
    }
}

struct FilterableProductTable: View {
    @State var text: String = ""
    @State var showingInStockItems: Bool = false
    
    var bordered: Bool = false

    var list: [Model] {
        var list = mockedList
        
        if !text.isEmpty {
            list = list.filter({ $0.name.lowercased().contains(text.lowercased()) })
        }
        
        if showingInStockItems {
            list = list.filter({ $0.stocked })
        }
        
        return list
    }
    

    var body: some View {
        VStack(spacing: 4) {
            SearchBar(text: $text, showingInStockItems: $showingInStockItems, bordered: bordered)
            ProductTable(items: list, bordered: bordered)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .frame(width: 300)
        .border(bordered ? .red : .clear)
        .padding()
        .shadow(radius: 3)
    }
}


struct FilteredListComponent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FilterableProductTable()
                .previewInterfaceOrientation(.landscapeLeft)
            FilterableProductTable(bordered: true)
                .previewInterfaceOrientation(.landscapeLeft)
        }
        .previewLayout(.sizeThatFits)
    }
}
