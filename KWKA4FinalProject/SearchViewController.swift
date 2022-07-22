//
//  SearchViewController.swift
//  KWKA4FinalProject
//
//  Created by Sandya Suresh on 7/20/22.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var searchBox: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var books: [BookCD] = []
    var searchedBooks: [BookCD] = []
    var previousVC = CompletedViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for j in 0...books.count-1{
            searchedBooks.append(books[j])
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedBooks.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
       let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
       let book = searchedBooks[indexPath.row]
       
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      // this gives us a single ToDo
      let book = books[indexPath.row]

        self.performSegue(withIdentifier: "moveToDetail", sender: book)
    }

    @IBAction func search(_ sender: Any) {
        searchedBooks.removeAll()
        let text = searchBox.text ?? ""
        NSLog(text)
        for j in 0...books.count-1{
            if((books[j].title?.contains(text)) != false){
                searchedBooks.append(books[j])
                NSLog(books[j].title ?? "no title")
            }
        }
        tableView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let completedVC = segue.destination as? CompletedViewController {
            completedVC.books = books
        }
        if let homeVC = segue.destination as? HomeViewController {
            homeVC.books = books
        }
        
    }


}
