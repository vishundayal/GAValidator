//
//  SettingsView.swift
//  GAValidator
//
//  Created by Vishun on 12/10/20.
//

import SwiftUI
import GoogleSignIn

struct SettingsView: View {
    let signInButton = GIDSignInButtonView()
    @State var isPresented = false
    var body: some View {
        signInButton
            .makeStye(style: .wide)
            .makeColorScheme(scheme: .light)
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
