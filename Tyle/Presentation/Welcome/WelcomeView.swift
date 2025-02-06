//
//  WelcomeView.swift
//  Tyle
//
//  Created by Vitoria Garcia on 23/1/25.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        VStack {
            Text("Welcome")
                .font(.title)
            Button {
                router.navigateTo(.login)
            } label: {
                Text("Login")
            }
            Button {
                router.navigateTo(.signup)
            } label: {
                Text("Sign Up")
            }
            
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    WelcomeView()
        .environmentObject(Router())
}
