//
//  TyleTabView.swift
//  Tyle
//
//  Created by Vitoria Garcia on 4/2/25.
//

import SwiftUI

struct TyleTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            CreatePostView()
                .tabItem {
                    Label("Home", systemImage: "plus")
                }
            ProfileView()
                .tabItem {
                    Label("Home", systemImage: "person")
                }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    TyleTabView()
}
