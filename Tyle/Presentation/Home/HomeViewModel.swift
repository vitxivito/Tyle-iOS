//
//  HomeViewModel.swift
//  Tyle
//
//  Created by Vitoria Garcia on 27/1/25.
//

import Combine

class HomeViewModel: ObservableObject {
    private let manager = FirebaseManager()
    @Published var hometype: HomeType = .all
    @Published var posts: [Post] = []
    @Published var friends: [String] =  []
    enum HomeType: String, CaseIterable, Identifiable {
        case all
        case following
        var id: Self { self }
    }
    func getAllPosts() {
        manager.getFriendsOfCurrentUser { friendsList, result in
            if result.isError{
                print(result.message)
                return
            }
            self.friends = (friendsList) ?? []
        }
            
        manager.getAllPosts { posts, result in
            if result.isError{
                print(result.message)
                return
            }
            self.posts = posts ?? []
            
        }
    }
    func showFollow(for post: Post) -> Bool {
       let userId = post.userId
        return !friends.contains(userId)
    }
}

