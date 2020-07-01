//
//  Auth.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/30/20.
//

import SwiftUI
import FirebaseAuth
import AuthenticationServices

struct AuthView: View {
    @Environment(\.colorScheme) var colorScheme
    
    func handleAuth(authResults: ASAuthorization) {
        if let idCredential = authResults.credential as? ASAuthorizationAppleIDCredential {
            guard let idToken = idCredential.identityToken else {
                print("Unable to fetch identity token")
                return
              }
            
            guard let idTokenString = String(data: idToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(idToken.debugDescription)")
                return
              }
            
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: "nothing")
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if (error != nil) {
                    print(error!.localizedDescription)
                    return
                }
            }
        }
        
    }

    var body: some View {
        VStack {
            SignInWithAppleButton(
                .signIn,
                onRequest: { request in
                    request.requestedScopes = [.fullName, .email]
                },
                onCompletion: { result in
                    switch result {
                    case .success (let authResults):
                        handleAuth(authResults: authResults)
                    case .failure (let error):
                        print("Authorization failed: " + error.localizedDescription)
                    }
                }
            )
            .signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
            .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct Auth_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
            .preferredColorScheme(.dark)
            
    }
}
