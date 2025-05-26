//
//  ProfileView.swift
//  Tyle
//
//  Created by Vitoria Garcia on 28/1/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vm : ProfileViewModel
    @EnvironmentObject var router: Router
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        ScrollView{
            VStack {
                profileCard()
                profilePosts()
                
                Spacer()
            }
            .padding(.horizontal)
            .task {
                vm.getPosts()
                vm.getUserProfile()
            }
            .onChange(of: vm.goToWelcome) { oldValue, newValue in
                router.popToRoot()
            }
        }
    }
}

private extension ProfileView{
    @ViewBuilder
    func profilePosts() -> some View {
        LazyVGrid(columns: columns) {
            ForEach(vm.posts, id:\.self) {post in
                PostViewMini(post: post)
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
    @ViewBuilder
    func profileCard() -> some View {
        Text(vm.username)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .safeAreaInset(edge: .trailing) {
                Menu("...") {
                    Button("Cerrar sesión") {
                        vm.logOut()
                    }
                }
            }
        HStack(spacing: 32){
            Button{
                
            } label: {
                Image(._03)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(maxWidth: 100)
                    .clipShape(.buttonBorder)
            }
            Button {
            } label: {
                VStack {
                    Text("\(vm.friendsAmount)")
                        .fontWeight(.semibold)
                    Text("Amigos")
                        .fontWeight(.light)
                }
            }
            .tint(.black)

            VStack {
                Text("\(vm.postCount)")
                    .fontWeight(.semibold)
                Text("Posts")
                    .fontWeight(.light)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        Divider()
        Text(vm.bio)
            .fontWeight(.thin)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
#Preview {

    ProfileView(vm: .init(username: "holi"))
}
