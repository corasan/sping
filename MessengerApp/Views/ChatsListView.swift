//
//  ChatsListView.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/30/20.
//

import SwiftUI

struct ChatsListView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: AuthView()) {
                Text("AuthView")
            }
            List {
                ChatItem()
                ChatItem()
            }
            .navigationBarTitle(Text("Chats"), displayMode: .large)
            .edgesIgnoringSafeArea(.top)
            
        }
    }
}

struct ChatsListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsListView()
    }
}
