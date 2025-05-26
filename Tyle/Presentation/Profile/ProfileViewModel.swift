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
    @Published var bio: String = ""
    @Published var friendsAmount = 0
    @Published var pendingFriendsAmount = 0
    @Published var goToWelcome = false


    private let manager = FirebaseManager()
    init(username: String) {
        self.username = username
    }
    func getPosts(){
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
    func getUserProfile(){
        manager.getUser(with: username) { user, result in
            if result.isError{
                //show error
                print(result.message)
                return
            }
            if let user {
                self.bio = user.bio
                self.friendsAmount = user.friends.count
            }
        }
    }
    func isPersonalUser()-> Bool {
        username == (manager.getCurrentUserEmail() ?? "")
    }
    func logOut(){
        manager.logOut { result in
            if result .isError{
                //show error
                print(result.message)
                return
            }
            self.goToWelcome = true
        }
        
    }
}
