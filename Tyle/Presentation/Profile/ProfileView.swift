//
//  ProfileView.swift
//  Tyle
//
//  Created by Vitoria Garcia on 28/1/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vm : ProfileViewModel
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
            
            if vm.isPersonalUser(){
                
            Button {
            } label: {
                VStack {
                    Text("\(vm.pendingFriendsAmount)")
                        .fontWeight(.semibold)
                    Text("Pendientes")
                        .fontWeight(.light)
                }
            }
            .tint(.black)
        }
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
