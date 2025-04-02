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
                Picker("Home", selection: $vm.hometype) {
                    ForEach(HomeViewModel.HomeType.allCases) { type in
                        Text(type.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                
            }
        }
    }
}
private extension HomeView {
    @ViewBuilder
    func allPosts() -> some View {
        Text("Todos los posts")
            .onAppear{vm.getAllPosts()}
    }
    @ViewBuilder
    func followingPosts() -> some View {
        Text("Posts siguiendo")
    }
}
#Preview {
    HomeView()
}
