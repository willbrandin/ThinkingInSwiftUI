//
//  Model.swift
//  ThinkingInSwiftUI
//
//  Created by William Brandin on 1/20/22.
//

import Foundation

public let mockedList = [
    Model(category: .sportingGoods, price: "$49.99", stocked: true, name: "Football"),
    Model(category: .sportingGoods, price: "$9.99", stocked: true, name: "Baseball"),
    Model(category: .sportingGoods, price: "$29.99", stocked: false, name: "Basketball"),
    Model(category: .electronics, price: "$99.99", stocked: true, name: "iPod Touch"),
    Model(category: .electronics, price: "$399.99", stocked: false, name: "iPhone 5"),
    Model(category: .electronics, price: "$199.99", stocked: true, name: "Nexus"),
]

public struct Model: Identifiable {
    
    public enum Category {
        case electronics
        case sportingGoods
        
        public var title: String {
            switch self {
            case .electronics:
                return "Electronics"
            case .sportingGoods:
                return "Sporting Goods"
            }
        }
    }
                        
    public var category: Category
    public var price: String
    public var stocked: Bool
    public var name: String
    
    public var id: String {
        return price
    }
}
