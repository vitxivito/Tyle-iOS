//
//  LoginView.swift
//  Tyle
//
//  Created by Vitoria Garcia on 23/1/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm = LoginViewModel()
    @EnvironmentObject var router: Router
    var body: some View {
        VStack(spacing:16) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 100)
            
            Text("Login")
                .font(.title)
            Spacer()
            TextField("Email", text: $vm.email )
                .textFieldStyle(PrimaryTextField())
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            SecureField("Password", text: $vm.password)
                .textFieldStyle(PrimaryTextField())
           Spacer()
            Button {
                vm.login()
            } label: {
                Text("Login")
            }
            .buttonStyle(.primary)

        }
        .onChange(of: vm.showTab) {
            if vm.showTab {
                router.navigateTo(.tab)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    LoginView()
        .environmentObject(Router())
}
