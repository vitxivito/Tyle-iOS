//
//  PostViewMini.swift
//  Tyle
//
//  Created by Vitoria Garcia on 20/5/25.
//

import SwiftUI

struct PostViewMini: View {
    var post: Post
    var body: some View {
        VStack(alignment: .leading) {
            Image(base64String: post.img)?
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ProfileView(vm: .init(username: ""))
}
