//
//  CustomContentForPostCell.swift
//  Homework3
//
//  Created by Григорий on 06.11.2020.
//

import UIKit

protocol CustomCell {
        
    static func cellNib() -> UINib?
        
    static func cellIdentifier() -> String
}

class CustomPostCell: UITableViewCell, CustomCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    
    func configure(post: Post) {
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        avatarImageView.clipsToBounds = true
        
        
        if let text = post.postContent {
            contentLabel.text = text
        }
        else {
            contentLabel.isHidden = true
        }
        
        if let imageName = post.postImage {
            contentImageView.image = UIImage(named: imageName)
        }
        else {
            contentImageView.isHidden = true
        }
    }

    //Данный метод возвращает у наследника UITableViewCell его Nib.
    static func cellNib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    //Данный метод возвращает у наследника UITableViewCell его идентификатор, то есть название.
    static func cellIdentifier() -> String {
        return String(describing: self)
    }

    //Данный метод используется при переиспользовании ячейки таблицы. Чтобы не обнулить прежние ячейки.
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.contentLabel.isHidden = false
        self.contentImageView.isHidden = false
    }
}
