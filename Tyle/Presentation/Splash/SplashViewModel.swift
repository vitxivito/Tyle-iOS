//
//  SplashViewModel.swift
//  Tyle
//
//  Created by Vitoria Garcia on 28/1/25.
//

import Combine

class SplashViewModel: ObservableObject {
    private let manager = FirebaseManager()
    func checkUser(){
        manager.getUser(with: manager.auth.currentUser?.email) { user, result in
            if result.isError {
                // navegar a welcome
            } else {
                //navegar a home
            }
        }
    }
}
