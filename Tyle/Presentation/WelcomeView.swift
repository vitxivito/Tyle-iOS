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
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 100)
            
            Text("Welcome")
                .font(.title)
                Spacer()
    
            Button {
                router.navigateTo(.login)
            } label: {
                Text("Login")
            }
            .buttonStyle(.primary)
            Button {
                router.navigateTo(.signup)
            }label: {
                Text("Sign Up")
            }
            .buttonStyle(.secondary)
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .padding(.horizontal)
    }
}

#Preview {
    WelcomeView()
        .environmentObject(Router())
}
