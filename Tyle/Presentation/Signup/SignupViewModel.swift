 
//
//  SignupViewmodel.swift
//  Tyle
//
//  Created by Vitoria Garcia on 17/1/25.
//
import Combine

class SignupViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    private let manager = FirebaseManager()
    
    func signup() {
        if email.isEmpty || username.isEmpty || password.isEmpty {
            return
        }
        if checkMatchingPasswords() {
            manager.createUser(username: username, email: email, password: password)
            
        }
    }
}

private extension SignupViewModel {
    func checkMatchingPasswords() -> Bool {
        return password == confirmPassword
    }
}
