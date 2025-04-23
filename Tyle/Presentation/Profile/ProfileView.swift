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
        Text("Profile")
    }
}

#Preview {
    ProfileView()
}
