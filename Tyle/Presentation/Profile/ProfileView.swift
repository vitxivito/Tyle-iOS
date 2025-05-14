//
//  ProfileView.swift
//  Tyle
//
//  Created by Vitoria Garcia on 28/1/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vm = ProfileViewModel()
    var body: some View {
        VStack{
            Text("user-id")
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
                        Text("Amigos")
                    }
                }
                .tint(.black)
                VStack {
                    Text("1")
                    Text("Posts")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            Text("biografia")
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
