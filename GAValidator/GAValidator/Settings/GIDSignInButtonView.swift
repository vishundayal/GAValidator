//
//  GIDSignInButtonView.swift
//  GAValidator
//
//  Created by Vishun on 12/10/20.
//

import GoogleSignIn
import SwiftUI

struct GIDSignInButtonView: UIViewRepresentable {
    typealias UIViewType = GIDSignInButton
    let button = GIDSignInButton()
    
    func makeUIView(context: Self.Context) -> Self.UIViewType {
        button
    }
    func updateUIView(_ uiView: GIDSignInButton, context: Context) {
        
    }
    
    // MARK: custom
    func makeStye(style:GIDSignInButtonStyle) -> GIDSignInButtonView {
        button.style = .wide
        return self
    }
    func makeColorScheme(scheme:GIDSignInButtonColorScheme) -> GIDSignInButtonView {
        button.colorScheme = scheme
        return self
    }

}
