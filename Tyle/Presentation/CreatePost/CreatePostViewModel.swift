//
//  CreatePostViewModel.swift
//  Tyle
//
//  Created by Vitoria Garcia on 28/1/25.
//

import Combine
import UIKit
import SwiftUICore

class CreatePostViewModel: ObservableObject {
    @Published var caption: String = ""
    @Published var showImagePicker: Bool = false
    @Published var inputImage: UIImage?
    @Published var image: Image = .init(uiImage: .init())
    @Published var showSuccess = false
    @Published var showError = false
    @Published var error = ""
    var canPublish: Bool = false
    let firebaseManager = FirebaseManager()
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        canPublish = true
    }
    func uploadPost(){
        guard let img = convertUIImageToBase64(inputImage), let user = firebaseManager.getCurrentUserEmail() else {
            // error
            error = "Imagen o usuarios incorrectos"
            showError = true
            return
        }
        let post = Post(caption: caption, date: .now, img: img, userId: user)
        firebaseManager.uploadPost(post: post) { [weak self] result in
            guard let self else {return}
            if result.isError{
                //error
                error = result.message
                showError = true
                return
            }
            caption = ""
            inputImage = nil
            image = .init(uiImage: .init())
            canPublish = false
            showSuccess = true
        }
    }
    func convertUIImageToBase64(_ image: UIImage?) -> String? {
        guard let imageData = image?.jpegData(compressionQuality: 0.1) else {
            return nil
        }
        return imageData.base64EncodedString()
        
    }
    
}
