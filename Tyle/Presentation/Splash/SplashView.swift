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
        Text("Splash")
        ProgressView()
            .task {
                vm.checkUser()
            }
            .onChange(of: vm.showTab) {
                if vm.showTab {
                    router.navigateTo(.tab)
                }
            }
            .fullScreenCover(isPresented: $vm.showWelcome) {
                WelcomeView()
            }
    }
}

#Preview {
    SplashView()
        .environmentObject(Router())
}
