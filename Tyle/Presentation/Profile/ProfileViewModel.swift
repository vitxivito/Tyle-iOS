//
//  ProfileViewModel.swift
//  Tyle
//
//  Created by Vitoria Garcia on 28/1/25.
//


import Combine

class ProfileViewModel: ObservableObject {
   @Published var postCount = 80
    @Published var username = ""
    private let manager = FirebaseManager()
    func getPosts(){
        if let username = manager.getCurrentUserEmail(){
            self.username  = username
            manager.getPosts(from: username) { posts, result in
                if result.isError{
                    //show error
                    print(result.message)
                    return
                }
                if let posts {
                    print(posts)
                }
            }
        }
        
        
    }
}
