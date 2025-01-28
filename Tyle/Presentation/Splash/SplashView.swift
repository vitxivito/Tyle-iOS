//
//  SplashView.swift
//  Tyle
//
//  Created by Vitoria Garcia on 28/1/25.
//

import SwiftUI

struct SplashView: View {
    @StateObject var vm = SplashViewModel()
    var body: some View {
        Text("Splash")
        ProgressView()
    }
}

#Preview {
    SplashView()
}
