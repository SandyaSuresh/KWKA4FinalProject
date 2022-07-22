//
//  HomeViewController.swift
//  KWKA4FinalProject
//
//  Created by Sandya Suresh on 7/20/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var previousVC = CompletedViewController()
    var books: [BookCD] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDatabase()
        //createBooks()
        // Do any additional setup after loading the view.
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
    
    func initializeDatabase(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataBooks = try? context.fetch(BookCD.fetchRequest()) as? [BookCD] {
                    books = coreDataBooks
            }
        }
   }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let completedVC = segue.destination as? CompletedViewController {
            completedVC.books = books
        }
        if let searchVC = segue.destination as? SearchViewController {
            searchVC.books = books
        }
    }
    

}
