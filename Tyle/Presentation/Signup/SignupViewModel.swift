 
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
    
    func signup() {
        
    }
}
