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
        VStack {
            ZStack{
                vm.image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: .infinity)
                if !vm.canPublish {
                    Button {
                        vm.showImagePicker.toggle()
                    } label: {
                        Text(" + Subir foto")
                    }
                    .buttonStyle(.tertiary)
                } else {
                    VStack{
                        HStack {
                            Spacer()
                            Button {
                                vm.showImagePicker.toggle()
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .shadow(radius: 4)
                            }
                            .padding()
                            .tint(.white)
                        }
                        Spacer()
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: .infinity)
                    
                }
            }
            Divider()
            TextField("Añadir pie de foto", text: $vm.caption)
                .padding(.vertical)
            Spacer()
            
            Button {
            } label: {
                Text("Publicar")
            }
            .buttonStyle(.primary)
            .disabled(!vm.canPublish)
        }
        .padding(.horizontal)
        .sheet(isPresented: $vm.showImagePicker) {
            ImagePicker(image: $vm.inputImage)
        }
        .onChange(of: vm.inputImage) {
            vm.loadImage()
        }
    }
    
}

#Preview {
    CreatePostView()
}
