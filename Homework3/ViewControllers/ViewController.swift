//
//  ViewController.swift
//  Homework3
//
//  Created by Григорий on 06.11.2020.
//

import UIKit

protocol ViewControllerDelegate {
    func updateContent(text: String?)
    
    func deletePost()
}

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, ViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = PostProducer.getCreatedPosts()
    
    var selectedPostIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        tableView.registerCustomCell(CustomContentForPostCell.self)
        let cellNib = UINib(nibName: "CustomPostCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "cell")
    }

    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomPostCell
        
        cell.configure(post: posts[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showFullPostViewControllerSegue", let currentPost = sender as? Post {
            
            let destinationController = segue.destination as! FullPostViewController

            destinationController.post = currentPost
            destinationController.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)

        let post = posts[indexPath.row]
        
        selectedPostIndex = indexPath.row
        
        performSegue(withIdentifier: "showFullPostViewControllerSegue", sender: post)
    }
    
    func updateContent(text: String?) {

        posts[selectedPostIndex].postContent = text
        
        if posts[selectedPostIndex].isEmpty() {
            posts.remove(at: selectedPostIndex)
        }
        
        tableView.reloadData()
    }
    
    func deletePost() {
        posts.remove(at: selectedPostIndex)
        tableView.reloadData()
    }
    
}

extension UITableView {
    
    func registerCustomCell(_ cell: CustomCell.Type) {
        
        self.register(cell.cellNib(), forCellReuseIdentifier: cell.cellIdentifier())
    }
}

