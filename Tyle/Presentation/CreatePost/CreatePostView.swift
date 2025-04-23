//
//  CreatePostView.swift
//  Tyle
//
//  Created by Vitoria Garcia on 28/1/25.
//

import SwiftUI

struct CreatePostView: View {
    @StateObject var vm = CreatePostViewModel()
    var body: some View {
        Text("Create Post")
    }
}

#Preview {
    CreatePostView()
}
