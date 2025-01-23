//
//  LoginViewModel.swift
//  Tyle
//
//  Created by Vitoria Garcia on 23/1/25.
//

import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showAlert: Bool = false
    
    func login(){
        
    }
}
