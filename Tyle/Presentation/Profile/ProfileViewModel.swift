//
//  ProfileViewModel.swift
//  Tyle
//
//  Created by Vitoria Garcia on 28/1/25.
//


import Combine

class ProfileViewModel: ObservableObject {
    @Published var postCount = 80
    @Published var username : String
    @Published var posts : [Post] = []
    private let manager = FirebaseManager()
    init(username: String) {
        self.username = username
    }
    func getPosts(){
        self.username  = username
        manager.getPosts(from: username) { posts, result in
            if result.isError{
                //show error
                print(result.message)
                return
            }
            if let posts {
                self.posts = posts
                self.postCount = posts.count
                
            }
        }
        
        
        
    }
}
