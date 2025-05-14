//
//  SplashView.swift
//  Tyle
//
//  Created by Vitoria Garcia on 28/1/25.
//

import SwiftUI

struct SplashView: View {
    @StateObject var vm = SplashViewModel()
    @EnvironmentObject var router: Router
    var body: some View {
        Text("Tyle")
        ProgressView()
            .task {
                vm.checkUser()
            }
            .onChange(of: vm.showTab) {
                if vm.showTab {
                    router.navigateTo(.tab)
                }
            }
            .onChange(of: vm.showWelcome) {
                if vm.showWelcome {
                    router.navigateTo(.welcome)
                }
            }
        
    }
}

#Preview {
    SplashView()
        .environmentObject(Router())
}
