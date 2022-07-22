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
    var tags: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        createBooks()
        initializeDatabase()
        //for book in books{
        //    print("Title: \(book.title) Author: \(book.author) Tags: \(book.tags)")
        //}
        // Do any additional setup after loading the view.
    }
    
    func createBooks(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                // Determine the file name
            if let path = Bundle.main.path(forResource: "booklist", ofType: "txt") {
              do {
                let contents = try String(contentsOfFile: path, encoding: .utf8)
             
                //let filename = "/Users/sandya/Desktop/booklist.txt"

                // Read the contents of the specified file
                //let contents = try! String(contentsOfFile: filename)

                // Split the file into separate lines
                let lines = contents.split(separator:"~")
                    //print(contents.split(separator: "~") )
            
                let tagString = lines[0].split(separator:",")
                //print(lines[0].split(separator: ","))
                for tag in tagString{
                    tags.append(String(tag))
                }
            
                //NSLog(String(lines.count))
    
                for line in 1...lines.count-1{
                    //NSLog(String(lines[line]))
                        
                    let items = lines[line].split(separator:",")
                    let book = BookCD(entity: BookCD.entity(), insertInto: context)
                    book.title = String(items[0])
                    book.author = String(items[1])
                    book.tags = ""
                    for item in 2...items.count - 1{
                        book.tags!.append(String(items[item]))
                    }
                    book.reading = 0
                    //NSLog("Title: \(book.title) Author: \(book.author) Tags: \(book.tags)")
                }
                try? context.save()
              } catch let error{
                print(error)
              }
            }
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
