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
    
    var previousVC = SearchViewController()
    var selectedBook: BookCD?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedBook?.title
        authorLabel.text = selectedBook?.author
        tagsLabel.text = selectedBook?.tags
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func wantTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            selectedBook?.reading = 1
        }
    }
    @IBAction func readTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            selectedBook?.reading = 2
        }
    }
    @IBAction func compTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            selectedBook?.reading = 3
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
