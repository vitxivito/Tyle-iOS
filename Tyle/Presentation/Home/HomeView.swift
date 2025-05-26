//
//  HomeView.swift
//  Tyle
//
//  Created by Vitoria Garcia on 27/1/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    @EnvironmentObject var router: Router
    var body: some View {
        ScrollView {
            VStack {
                Text("Home")
                    .font(.title)
                Picker("Home", selection: $vm.hometype) {
                    ForEach(HomeViewModel.HomeType.allCases) { type in
                        Text(type.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                switch vm.hometype {
                case .all:
                    allPosts()
                case .following:
                    followingPosts()
                    
                }
                
            }
            .onAppear{vm.getAllPosts()}
        }
    }
}
private extension HomeView {
    @ViewBuilder
    func allPosts() -> some View {
        LazyVStack{
            ForEach(vm.posts, id: \.self) { post in
                PostView(post: post, profileAction: {
                    router.navigateTo(.profile(post.userId))
                }, followAction: {
                    vm.getAllPosts()
                    
                }, showFollow: vm.showFollow(for: post))
            }
        }
        
    }
    @ViewBuilder
    func followingPosts() -> some View {
        Text("Posts siguiendo")
    }
}
#Preview {
    HomeView()
}
