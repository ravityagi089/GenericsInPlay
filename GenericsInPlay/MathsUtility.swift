//
//  MathsUtility.swift
//  GenericsInPlay
//
//  Created by Ravi Tyagi on 31/07/16.
//  Copyright © 2016 Ravi Tyagi. All rights reserved.
//

import Foundation

protocol Shelf {
    
    associatedtype Item
    
    init()
    
    var numberOfItems: Int { get }
    
    mutating func addItem(item: Item)
    
    mutating func removeItem(item: Item) -> Item?
    
}



struct AnyShelf<Item>: Shelf {
    
    private var _items: [Item]
    
    // Empty Shelf
    init() {
        _items = [Item]()
    }
    
    
    var numberOfItems: Int {
        
        return _items.count
    }
    
    
    mutating func addItem(item: Item) {
        _items.append(item)
    }
    
    
    
    mutating func removeItem(item: Item) -> Item? {
        
        return nil
    }
    
}


extension AnyShelf: ExpressibleByArrayLiteral {
    
    typealias Element = Item
    
    init(arrayLiteral elements: Element...) {
        self.init()
        
        for  item in elements {
            _items.append(item)
        }
    }
    
}



// As for in ... syntax is governed by Sequence Protocol

struct AnyShelfSequenceGenerator<T> : IteratorProtocol {
    
    var items: Array<T>
    
    mutating func next() -> T? {
        
        if items.isEmpty { return nil }
        
        return  items.removeFirst()
    }
}


extension AnyShelf : Sequence {
    
    func makeIterator() -> AnyShelfSequenceGenerator<Item> {
        return AnyShelfSequenceGenerator(items: _items)
    }
    
}

