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
                    Label("", systemImage: "house")
                }
            CreatePostView()
                .tabItem {
                    Label("", systemImage: "plus")
                }
            ProfileView()
                .tabItem {
                    Label("", systemImage: "person")
                }
        }
        .navigationBarBackButtonHidden()
        .tint(Color.pink)
    }
}

#Preview {
    TyleTabView()
}
