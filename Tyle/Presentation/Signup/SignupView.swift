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
            Spacer()
            TextField("Username", text: $vm.username)
                .textFieldStyle(PrimaryTextField())
            TextField("Email", text: $vm.email )
                .textFieldStyle(PrimaryTextField())
            TextField("Password", text: $vm.password)
                .textFieldStyle(PrimaryTextField())
            TextField("Confirm Password", text: $vm.confirmPassword)
                .textFieldStyle(PrimaryTextField())
            Spacer()
            Button {
                vm.signup()
            } label: {
                Text("Sign up")
            }
            .buttonStyle(.primary)

        }
        .padding(.horizontal)
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
