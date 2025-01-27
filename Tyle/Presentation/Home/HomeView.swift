//
//  HomeView.swift
//  Tyle
//
//  Created by Vitoria Garcia on 27/1/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    var body: some View {
        ScrollView {
            VStack {
                Text("Home")
                    .font(.title)
                allPosts()
            }
        }
    }
}
private extension HomeView {
    @ViewBuilder
    func allPosts() -> some View {
        Text("Todos los posts")
    }
    @ViewBuilder
    func followingPosts() -> some View {
        Text("Posts siguiendo")
    }
}
#Preview {
    HomeView()
}
