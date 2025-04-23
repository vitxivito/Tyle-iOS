//
//  ButtonStyles.swift
//  Tyle
//
//  Created by Vitoria Garcia on 19/2/25.
//

import SwiftUI

struct PrimaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(.black)
            .foregroundStyle(Color.white)
            .font(.title)
            .clipShape(.capsule)
    }
}
extension ButtonStyle where Self == PrimaryButton {
    static var primary: PrimaryButton {
        PrimaryButton()
    }
}
// MARK: - SECONDARY BUTTON

struct SecondaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(.white)
            .foregroundStyle(Color.black)
            .font(.title2)
            .clipShape(.capsule)
            .overlay {
                Capsule()
                    .stroke(.black)
            }
    }
}
extension ButtonStyle where Self == SecondaryButton {
    static var secondary: SecondaryButton {
        SecondaryButton()
    }
}

// MARK: - TERTIARY BUTTON

struct TertiaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(.white)
            .foregroundStyle(Color.black)
            .font(.title3)
            .clipShape(.capsule)
            .underline()
            
    }
}
extension ButtonStyle where Self == TertiaryButton {
    static var tertiary: TertiaryButton {
        TertiaryButton()
    }
}
// MARK: - PREVIEWS
struct ButtonPreviews: View {
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
    ButtonPreviews()
}
