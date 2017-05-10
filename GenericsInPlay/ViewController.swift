//
//  ViewController.swift
//  GenericsInPlay
//
//  Created by Ravi Tyagi on 31/07/16.
//  Copyright © 2016 Ravi Tyagi. All rights reserved.
//

import UIKit

struct Book {
    var name: String
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var shelf = AnyShelf<Book>()
            shelf.addItem(item: Book(name: "Book1"))
            shelf.addItem(item: Book(name: "Book2"))
            shelf.addItem(item: Book(name: "Book3"))
            shelf.addItem(item: Book(name: "Book4"))
            shelf.addItem(item: Book(name: "Book5"))

    
        for x in shelf {
            print(x)
        }
        
        
        
        _ = binarySearch(sortedKeys: ["A","B","C","D","E"], searchKey: "F")
    
        
    }



}



protocol Ordered {
    
    func preceeds(other: Self) -> Bool
}


extension String: Ordered {
    func preceeds(other: String) -> Bool {
        if self < other {  return true  }
        else { return false }
    }
}




func binarySearch<T:Ordered>(sortedKeys: [T], searchKey key: T) -> Int {
    
    var lower = 0
    var upper = sortedKeys.count
    
    while lower < upper {
        
        let mid  =  lower + (upper - lower)/2
    
        if sortedKeys[mid].preceeds(other: key) { lower  = mid + 1 }
        else {
            upper = mid - 1
        }
    }
    
    return lower
    
}



