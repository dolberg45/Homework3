//
//  EditPostViewController.swift
//  Homework3
//
//  Created by Григорий on 06.11.2020.
//

import UIKit

protocol FullPostViewControllerDelegate {
    func update(text: String)
}

class FullPostViewController: UIViewController, FullPostViewControllerDelegate {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    var delegate: ViewControllerDelegate?
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentLabel.text = post.postContent
        
        if let image = post.postImage {
            contentImageView.image = UIImage(named: image)
        } else {
            contentImageView.isHidden = true
        }
        
    }
    
    func update(text: String) {
        contentLabel.text = text
        delegate?.updateContent(text: contentLabel.text!)
        navigationController?.popViewController(animated: true)
    }
    
    
//MARK: - Actions

    @IBAction func pressButtonAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Действия", message: "Выберите одно из действий", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Редактировать", style: .default, handler: { (_) in
            
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "EditPostViewController") as? EditPostViewController
            viewController?.delegate = self
            viewController?.text = self.contentLabel.text!
            self.navigationController?.pushViewController(viewController!, animated: true)
            }))

        alert.addAction(UIAlertAction(title: "Удалить", style: .destructive, handler: { (_) in
            
            let removeAlert = UIAlertController(title: nil, message: "Удалить пост?", preferredStyle: .actionSheet)
            removeAlert.addAction(UIAlertAction(title: "Удалить", style: .destructive, handler: { (_) in
                
                self.delegate?.deletePost()
                self.navigationController?.popToRootViewController(animated: true)
            }))
            
            removeAlert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { (_) in
                //...Cancel
            }))
            
            self.present(removeAlert, animated: true, completion: nil)
            
        }))

        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { (_) in
            //...Cancel
        }))

        self.present(alert, animated: true, completion: nil)
    }
}
