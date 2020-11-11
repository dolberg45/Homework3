//
//  EditPostViewController.swift
//  Homework3
//
//  Created by Григорий on 08.11.2020.
//

import UIKit

class EditPostViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var text = "sa"
    
    var delegate: FullPostViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = text
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        
        delegate?.update(text: textView.text)
        navigationController?.popViewController(animated: true)
    }
}
