//
//  FirebaseManager.swift
//  Tyle
//
//  Created by Vitoria Garcia on 17/1/25.
//

import Firebase
import FirebaseAuth

class FirebaseManager {
    let auth = Auth.auth()
    let database = Firestore.firestore()
    
    // Create a new user with a username, email, and password
    func createUser(username: String, email: String, password: String, completion: @escaping (Result) -> Void) {
        userExists(username: username) { exists in
            if exists {
                completion(Result(message: "User already exists", isError: true))
                return
            }
            
            self.auth.createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    completion(Result(message: error.localizedDescription, isError: true))
                } else {
                    self.createProfile(username: username, email: email.lowercased()) { profileResult in
                        completion(profileResult) // Return profile creation result
                    }
                }
            }
        }
    }
    
    // Create a profile for a user in Firestore
    func createProfile(username: String, email: String, completion: @escaping (Result) -> Void) {
        let profile = User(username: username, friends: [], friendsPending: [], bio: "", email: email)
        let docRef = database.collection("users").document(email)
        docRef.setData([
            "username": profile.username,
            "bio": profile.bio,
            "friends": profile.friends,
            "friendsPending": profile.friendsPending
        ]) { error in
            if let error = error {
                completion(Result(message: error.localizedDescription, isError: true))
            } else {
                completion(Result(message: "Profile created successfully", isError: false))
            }
        }
    }
    
    // Check if a user exists by their username
    func userExists(username: String, completion: @escaping (Bool) -> Void) {
        let docRef = database.collection("users").whereField("username", isEqualTo: username).limit(to: 1)
        docRef.getDocuments { (querysnapshot, error) in
            if let error = error {
                print("Error checking user existence: \(error.localizedDescription)")
                completion(false)
            } else {
                if let documents = querysnapshot?.documents, !documents.isEmpty {
                    completion(true) // User exists
                } else {
                    completion(false) // User does not exist
                }
            }
        }
    }
    
    // Log in a user with email and password
    func login(email: String, password: String, completion: @escaping (Result) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let error {
                completion(Result(message: error.localizedDescription, isError: true))
            } else {
                completion(Result(message: "Login successful", isError: false))
            }
        }
    }
    
    // Get user document w email
    func getUser(with email: String?, completion: @escaping (User?, Result) -> Void) {
        let collectionRef = database.collection("users")
        
        // Query for the document with the matching email
        collectionRef.whereField("email", isEqualTo: email ?? "").getDocuments { [weak self] (querySnapshot, error) in
            guard let self else { return }
            if let error = error {
                completion(nil, Result(message: error.localizedDescription, isError: true)) // Pass error in completion handler
                return
            }
            
            guard let documents = querySnapshot?.documents, !documents.isEmpty else {
                completion(nil, Result(message: "User doesn't exist", isError: true))
                return
            }
            
            // Assuming only one document per email, return the first document
            if let documentData = documents.first?.data() {
                guard let user = parseUser(documentData: documentData) else {
                    completion(nil, Result(message: "Couldn not parse user", isError: true))
                    return
                }
                completion(user, Result(message: "", isError: false))
            }
        }
    }
    
    func parseUser(documentData: [String: Any]) -> User? {
        guard
            let username = documentData["username"] as? String,
            let friends = documentData["friends"] as? [String],
            let friendsPending = documentData["friendsPending"] as? [String],
            let bio = documentData["bio"] as? String,
            let email = documentData["email"] as? String
        else {
            // Return nil if any required field is missing or of the wrong type
            return nil
        }
        
        // Create and return the User object
        return User(username: username, friends: friends, friendsPending: friendsPending, bio: bio, email: email)
    }
    func getAllPosts(completion: @escaping ([Post]?, Result) -> Void) {
        database.collection("posts").order(by: "date", descending: true).getDocuments { (querySnapshot, error) in
            if let error {
                completion(nil, Result(message: error.localizedDescription, isError: true))
                return
            }
            var posts: [Post] = []
            for document in querySnapshot?.documents ?? [] {
                if let post = Post(document: document.data()) {
                    posts.append(post)
                }
            }
            completion(posts, Result(message:"", isError: false))
        }
    }
}
