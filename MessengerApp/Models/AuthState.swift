//
//  AuthState.swift
//  MessengerApp
//
//  Created by Henry Paulino on 7/1/20.
//

import Foundation
import FirebaseAuth

class AuthState: ObservableObject {
    @Published var isAuth: Bool = false
    @Published var user: User?
    private var listener: AuthStateDidChangeListenerHandle?
    
    func listen() {
        self.listener = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                print("IS__AUTHED__")
                self.user = user
                self.isAuth = true
            } else {
                print("IS__NOT__AUTHED__")
                self.isAuth = false
            }
        }
    }
    
    func stopListening() {
        Auth.auth().removeStateDidChangeListener(listener!)
    }
}
