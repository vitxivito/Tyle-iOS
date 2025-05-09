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
    var canPublish: Bool = false
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        canPublish = true
    }

}
