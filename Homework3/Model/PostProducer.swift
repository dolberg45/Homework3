//
//  PostProducer.swift
//  Homework3
//
//  Created by Григорий on 06.11.2020.
//

import Foundation

class PostProducer {
    
    static func getCreatedPosts() -> [Post] {
        var posts: [Post] = []
        
        posts.append(Post(postContent: "Привет, меня зовут Адам.", postImage: nil))
        posts.append(Post(postContent: "Мы с группой хорошо повеселились, создавая видео Go Tell Her Now. Надеюсь, оно заставит вас улыбнуться. Напоминаем, что итоги нашего конкурса будут подведены уже завтра — у вас ещё есть шанс получить билеты на ближайшие выступления Тома в России. Условия здесь", postImage: "tom1"))
        posts.append(Post(postContent: nil, postImage: "tom2"))
        posts.append(Post(postContent: "Мы с группой хорошо повеселились, создавая видео Go Tell Her Now. Надеюсь, оно заставит вас улыбнуться. Напоминаем, что итоги нашего конкурса будут подведены уже завтра — у вас ещё есть шанс получить билеты на ближайшие выступления Тома в России. Условия здесь", postImage: nil))
        posts.append(Post(postContent: "Hello, world", postImage: nil))
        posts.append(Post(postContent: "nil", postImage: "tom3"))
        posts.append(Post(postContent: nil, postImage: "tom4"))
        posts.append(Post(postContent: "Swift top", postImage: nil))
        posts.append(Post(postContent: "hello", postImage: nil))
        posts.append(Post(postContent: "world", postImage: nil))
        
        return posts
    }
}
