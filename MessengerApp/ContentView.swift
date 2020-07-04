//
//  ContentView.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/29/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authState: AuthState

    var body: some View {
        VStack {
            if (!self.authState.isAuth) {
                AuthView()
            } else {
                ChatsListView()
            }
        }.onAppear {
            self.authState.listen()
        }.onDisappear {
            self.authState.stopListening()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
