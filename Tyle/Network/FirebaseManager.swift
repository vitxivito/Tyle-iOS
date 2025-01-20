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
    
    func createUser(username: String, email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard let error else {
                // no ha habido error
                self.createProfile(username: username)
                return
            }
            // ha habido un error
        }
    }
    func createProfile(username: String) {
        let profile = User(username: username, friends: [], friendsPending: [], bio: "")
        let docRef = database.collection("users").document(username)
        docRef.setData(["username" : profile.username,
                        "bio" : profile.bio]) { error in
            // ha habido un error
        }
    }
    func userExists(username: String) -> Bool {
        let docRef = database.collection("users").whereField("username", isEqualTo: username).limit(to: 1)
        var result = true
        docRef.getDocuments { (querysnapshot, error) in
            if error != nil {
                print("Document Error: ", error!)
            } else {
                if let doc = querysnapshot?.documents, !doc.isEmpty {
                    result = true
                } else {
                    result = false
                }
            }
        }
        return result
    }
}
