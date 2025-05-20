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
            }
        }
    }
}

private extension ProfileView{
    @ViewBuilder
    func profilePosts() -> some View {
        LazyVGrid(columns: columns) {
            ForEach(1...vm.postCount, id: \.self) {_ in 
                Rectangle()
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
                    Text("0")
                        .fontWeight(.semibold)
                    Text("Amigos")
                        .fontWeight(.light)
                }
            }
            .tint(.black)
            VStack {
                Text("1")
                    .fontWeight(.semibold)
                Text("Posts")
                    .fontWeight(.light)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        Divider()
        Text("biografia")
            .fontWeight(.thin)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
#Preview {

    ProfileView(vm: .init(username: "holi"))
}
