//
//  LibraryAuthorViewController.swift
//  KWKA4FinalProject
//
//  Created by Ozi E. on 7/21/22.
//

import UIKit

class LibraryAuthorViewController: UIViewController {

    
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
    var books: [BookCD] = []
    var previousVC = SearchViewController()
    var selectedBook: BookCD?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //initializeDatabase()
        //print("Title: \(")
        titleLabel.text = selectedBook!.title
        authorLabel.text = selectedBook!.author
        tagsLabel.text = selectedBook!.tags
        
        for i in books{
            if(i.title == "The Help"){
                selectedBook = i
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func wantTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            selectedBook?.reading = 1
        }
        print("want to read")
    }
    @IBAction func readTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            selectedBook?.reading = 2
        }
        print("reading")
    }
    @IBAction func compTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            selectedBook?.reading = 3
        }
        print("completed")
    }
    @IBAction func remTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            selectedBook?.reading = 0
        }
        print("removed")
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
