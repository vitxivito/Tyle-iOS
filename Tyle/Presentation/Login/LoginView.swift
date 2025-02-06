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
        VStack {
            Text("Login")
                .font(.title)
            TextField("Email", text: $vm.email )
            TextField("Password", text: $vm.password)
            Button {
                vm.login()
            } label: {
                Text("Login")
            }
        }
        .onChange(of: vm.showTab) {
            if vm.showTab {
                router.navigateTo(.tab)
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(Router())
}
