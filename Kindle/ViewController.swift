//
//  ViewController.swift
//  Kindle
//
//  Created by Dominik Sadowski on 2/2/17.
//  Copyright © 2017 Dominik Sadowski. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var books: [Book]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Kindle"
        view.backgroundColor = .red
        
        setupBooks()
        
    }
    
    func setupBooks() {
        let page1 = Page(number: 1, text: "When i was little")
        let page2 = Page(number: 2, text: "this is page 2")
        
        let pages = [page1, page2]
        
        let book = Book(title: "Steve Jobs", author: "Walter Isaacson", pages: pages)
        print("Title: \(book.author), Author: \(book.title)")
        
        let book2 = Book(title: "Bill Gates a bio", author: "Michael Becraft", pages: [
            Page(number: 1, text: "page 1 i am bill"),
            Page(number: 2, text: "page 2 i am still bill"),
            Page(number: 3, text: "page 3 nope still bill"),
            Page(number: 4, text: "page 4 now im gwen")
            ])
        
        self.books = [book, book2]
        
        guard let books = self.books else {
            return
        }
        
        for book in books {
            print(book.title)
            for page in book.pages {
                print(page.text)
            }
        }
        
    }

}

