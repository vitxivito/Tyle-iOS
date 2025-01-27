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
        let profile = User(username: username, friends: [], friendsPending: [], bio: "")
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
}
