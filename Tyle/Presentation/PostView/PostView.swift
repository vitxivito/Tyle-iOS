//
//  PostView.swift
//  Tyle
//
//  Created by Vitoria Garcia on 15/4/25.
//

import SwiftUI

struct PostView: View {
    var post: Post
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: "person.crop.circle")
                Text(post.userId)
                Spacer()
                Button {
                    
                } label: {
                Text("Añadir")
                }
                .buttonStyle(.bordered)
            }
            .padding(.horizontal)
            Divider()
            Image(base64String: post.img)?
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(maxWidth: .infinity)
            Divider()
            Text(post.caption)
                .padding(.horizontal)
            Text(post.date.timeAgo())
                .padding(.horizontal)
                .font(.callout)
                .foregroundStyle(Color.gray)
            Divider()
        }
    }
}
extension Image {
    init?(base64String: String) {
        guard let data = Data(base64Encoded: base64String) else { return nil }
        guard let uiImage = UIImage(data: data) else { return nil }
        self = Image(uiImage: uiImage)
    }
    
}
extension Date {
    func timeAgo() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full // Use .abbreviated or .short if you prefer
        return "Hace \(formatter.localizedString(for: self, relativeTo: Date()))"
    }
}
#Preview {
    HomeView()
}
