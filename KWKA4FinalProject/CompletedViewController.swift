//
//  CompletedViewController.swift
//  KWKA4FinalProject
//
//  Created by Sandya Suresh on 7/20/22.
//

import UIKit

class CompletedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    var books: [BookCD]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //createBooks()
        tableView.reloadData()
        //NSLog("num: " + String(books.count))
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books!.count;
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
       let book = books![indexPath.row]
       
        if book.reading == 1{//want to read
            cell.imageView!.image = UIImage(named: "want to read")
            cell.textLabel?.text = "" + book.title!
        } else if book.reading == 2 {//reading
            cell.imageView!.image = UIImage(named: "reading")
            cell.textLabel?.text = "" + book.title!
        }else if book.reading == 3{//completed
            cell.imageView!.image = UIImage(named: "completed")
            cell.textLabel?.text = "" + book.title!
        }
        
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let searchVC = segue.destination as? SearchViewController {
            searchVC.previousVC = self
            searchVC.books = books!
        }
        
        if let homeVC = segue.destination as? HomeViewController {
            homeVC.previousVC = self
        }
    }



}
