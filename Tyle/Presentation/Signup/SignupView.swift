//
//  SignupView.swift
//  Tyle
//
//  Created by Vitoria Garcia on 17/1/25.
//

import SwiftUI

struct SignupView: View {
    @StateObject var vm = SignupViewModel()
    var body: some View {
        VStack {
            Text("Sign up")
                .font(.title)
            TextField("Username", text: $vm.username)
            TextField("Email", text: $vm.email )
            TextField("Password", text: $vm.password)
            TextField("Confirm Password", text: $vm.confirmPassword)
            Button {
                vm.signup()
            } label: {
                Text("Sign up")
            }
        }
        .padding()
        .alert(
            "Sign Up error",
            isPresented: $vm.showAlert
        ) {
            Button("OK") {
                // Handle the acknowledgement.
            }
        } message: {
            Text("Please check your credentials and try again.")
        }
    }
}

#Preview {
    SignupView()
}
