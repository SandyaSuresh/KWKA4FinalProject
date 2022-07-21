//
//  CompletedViewController.swift
//  KWKA4FinalProject
//
//  Created by Sandya Suresh on 7/20/22.
//

import UIKit

class CompletedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    var books: [BookCD] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //createBooks()
        initializeDatabase()
        //NSLog("num: " + String(books.count))
    }
    
    func createBooks(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let book1 = BookCD(entity: BookCD.entity(), insertInto: context)
            book1.title = "book1"
            book1.author = "author1"
            book1.tags = "trope1, trope3"
            book1.reading = 1
        
            let book2 = BookCD(entity: BookCD.entity(), insertInto: context)
            book2.title = "book2"
            book2.author = "author2"
            book2.tags = "trope2"
            book2.reading = 2
            
            let book3 = BookCD(entity: BookCD.entity(), insertInto: context)
            book3.title = "book3"
            book3.author = "author3"
            book3.tags = "trope3"
            book3.reading = 3
            
            let book4 = BookCD(entity: BookCD.entity(), insertInto: context)
            book4.title = "book4"
            book4.author = "author4"
            book4.tags = "trope1, trope, trope2, trope3"
            
            try? context.save()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count;
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
       let book = books[indexPath.row]
       
        if book.reading == 1{//want to read
            cell.imageView!.image = UIImage(named: "want to read")
        } else if book.reading == 2 {//reading
            cell.imageView!.image = UIImage(named: "reading")
        }else if book.reading == 3{//completed
            cell.imageView!.image = UIImage(named: "completed")
        }
        cell.textLabel?.text = "" + book.title!
        
        return cell
    }
    
    func initializeDatabase(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataBooks = try? context.fetch(BookCD.fetchRequest()) as? [BookCD] {
                    books = coreDataBooks
                    tableView.reloadData()
            }
        }
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let searchVC = segue.destination as? SearchViewController {
            searchVC.previousVC = self
        }
        
        if let homeVC = segue.destination as? HomeViewController {
            homeVC.previousVC = self
        }
    }



}
