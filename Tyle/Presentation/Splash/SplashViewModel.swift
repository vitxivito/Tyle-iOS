//
//  SplashViewModel.swift
//  Tyle
//
//  Created by Vitoria Garcia on 28/1/25.
//

import Combine

class SplashViewModel: ObservableObject {
    @Published var showWelcome = false
    @Published var showTab = false
    private let manager = FirebaseManager()
    func checkUser(){
        manager.getUser(with: manager.auth.currentUser?.email) {  [weak self] user, result in
            if result.isError {
                self?.showWelcome = true
            } else {
                self?.showTab = true
            }
        }
    }
}
