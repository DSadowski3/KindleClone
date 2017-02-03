//
//  ViewController.swift
//  Kindle
//
//  Created by Dominik Sadowski on 2/2/17.
//  Copyright © 2017 Dominik Sadowski. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    
    var books: [Book]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(BookCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        navigationItem.title = "Kindle"
        
        fetchBooks()
        
    }
    
    func fetchBooks() {
        print("fetching books ....")
        if let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if let err = error {
                    print("Failed to fetch extrenal json Books", err)
                }
                
                guard let data = data else {return}
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)

                    guard let bookDictionaries = json as? [[String: Any]] else {return}
                    
                    self.books = []
                    for bookDictionary in bookDictionaries {
                        if let title = bookDictionary["title"] as? String, let author = bookDictionary["author"] as? String {
                            let book = Book(title: title, author: author, image: #imageLiteral(resourceName: "steveJobs"), pages: [])
                            self.books?.append(book)
                        
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }catch let jsonError {
                    
                }
                
        }).resume()
            
            print("Have w fetched our books yet?")
        }

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedBook = self.books?[indexPath.row]
        
        let layout = UICollectionViewFlowLayout()
        let bookPagerController = BookPagerController(collectionViewLayout: layout)
        
        bookPagerController.book = selectedBook
        
        let navController = UINavigationController(rootViewController: bookPagerController)
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let count = books?.count{
            return count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BookCell
        let book = books?[indexPath.row]
        cell.book = book
        return cell
    }
    
    func setupBooks() {
        let page1 = Page(number: 1, text: "When i was little")
        let page2 = Page(number: 2, text: "this is page 2")
        
        let pages = [page1, page2]
        
        let book = Book(title: "Steve Jobs", author: "Walter Isaacson",image: #imageLiteral(resourceName: "steveJobs"), pages: pages)
        print("Title: \(book.author), Author: \(book.title)")
        
        let book2 = Book(title: "Bill Gates a bio", author: "Michael Becraft", image: #imageLiteral(resourceName: "billgates"), pages: [
            Page(number: 1, text: "page 1 i am bill"),
            Page(number: 2, text: "page 2 i am still bill"),
            Page(number: 3, text: "page 3 nope still bill"),
            Page(number: 4, text: "page 4 now im gwen")
            ])
        
        self.books = [book, book2]
        
    }

}

