import SwiftUI

/// Displays the `Model` title and price in a list item
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

/// Displays the ``Category`` title for a section in the list
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

/// Shows a list of products
/// Resposible for:
/// - Displaying the list
/// - Filtering based on a text input
/// - Hiding/Showing in/out of stock items
struct ProductTable: View {
    var items: [Model] = []
    var filteredText: String = ""
    var showingInStockItems: Bool = false
    var bordered: Bool = false
    
    var listItems: [Model] {
        var list = mockedList
        
        if !filteredText.isEmpty {
            list = list.filter({ $0.name.lowercased().contains(filteredText.lowercased()) })
        }
        
        if showingInStockItems {
            list = list.filter({ $0.stocked })
        }
        
        return list
    }
    
    var sections: [Model.Category] {
        return [.sportingGoods, .electronics]
    }
    
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
            
            ForEach(sections, id: \.self) { section in
                if !listItems.filter({ $0.category == section }).isEmpty {
                    ProductCategoryRow(title: section.title, bordered: bordered)
                    ForEach(listItems.filter({ $0.category == section })) { item in
                        ProductRow(item: item, bordered: bordered)
                    }
                }
            }
        }
        .border(bordered ? .purple : .clear)
    }
}

/// Product search bar
/// Responsible for:
/// - Allowing search capability
/// - Allow the user to hide unstocked items
///
/// Both of these actions will need to feed this `state`
/// up to it's parent view. Therefore a ``Binding`` is necessary.
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

/// The Final container and main entry for this feature
/// This contains all state and is responsible for passing down properties.
struct FilterableProductTable: View {
    @State private var text: String = ""
    @State private var showingInStockItems: Bool = false
    
    var bordered: Bool = false

    var body: some View {
        VStack(spacing: 4) {
            /// State being passed as a binding.
            /// ``SearchBar`` feeds it's state back up into ``FilterableProductTable``
            ///
            /// For a static version:
            /// You can use ``.constant(Value)`` to mock a binding.
            /// This will not be interactable but it's perfect for mocking up designs.
            /// We can also use ``allowsHitTesting(false`` to disable all touchable interactions.
            /// ``SearchBar(text: .constant(""), showingInStockItems: .constant(false), bordered: bordered)``
            /// 
            SearchBar(text: $text, showingInStockItems: $showingInStockItems, bordered: bordered)
            
            /// ``ProductTable`` only needs to read the state, not mutate it.
            /// Therefore we can pass state as properties and omit the `$`
            ProductTable(items: mockedList, filteredText: text, showingInStockItems: showingInStockItems, bordered: bordered)
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
