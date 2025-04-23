//
//  TextFieldStyles.swift
//  Tyle
//
//  Created by Vitoria Garcia on 19/2/25.
//
import SwiftUI

struct PrimaryTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .background(.red)
    }
}

// MARK: - PREVIEWS
struct TextFieldPreviews: View {
    var body: some View {
        VStack{
            Button{
                
            } label: {
                Text("Hola")
            }
            .buttonStyle(.primary)
            
            Button{
                
            } label: {
                Text("Hola")
            }
            .buttonStyle(.secondary)
            
            Button{
                
            } label: {
                Text("Hola")
            }
            .buttonStyle(.tertiary)
        }
        .padding()
    }
}

#Preview {
    TextFieldPreviews()
}


