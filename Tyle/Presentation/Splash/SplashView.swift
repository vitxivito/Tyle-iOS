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
                router.navigateTo(.tab)
            }
    }
}

#Preview {
    SplashView()
        .environmentObject(Router())
}
