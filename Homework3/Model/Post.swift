//
//  Post.swift
//  Homework3
//
//  Created by Григорий on 06.11.2020.
//

import Foundation

class Post {
    
    static var postCounter = 0
    
    let postId: Int
    var postContent: String?
    var postImage: String?
    
    init(postContent: String?, postImage: String?) {
        self.postContent = postContent
        self.postImage = postImage
        self.postId = Post.postCounter
        Post.postCounter += 1
    }
    
    public func isEmpty() -> Bool{
        if (postContent == "" || postContent == nil) && (postImage == "" || postImage == nil) {
            return true
        }
        return false
    }
}
