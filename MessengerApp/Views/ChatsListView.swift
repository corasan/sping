//
//  ChatsListView.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/30/20.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct ChatRoom: Identifiable {
    var id: String
    var members: Any
    var messages: [NSDictionary]
    var lastMessage: String
    
    subscript(lastMessage: String) -> String {
        return lastMessage
    }
}

struct ChatsListView: View {
    @EnvironmentObject var authState: AuthState
    var db = Firestore.firestore()
    @State var chatrooms = [ChatRoom]()
    
    func fetchChats(uid: String) {
        print("USER_UID___: \(uid)")
        self.db.collection("ChatRooms").whereField("members", arrayContains: uid).addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            
            let data = documents.map { doc -> ChatRoom in
                return ChatRoom(id: doc.documentID, members: doc.get("members") as Any, messages: doc.get("messages") as! [NSDictionary], lastMessage: doc.get("lastMessage") as! String)
            }
            self.chatrooms = data
        }
    }
    
    var body: some View {
        NavigationView {
            List(self.chatrooms) { chat in
                ChatItem(chatRoom: chat)
            }
            .navigationBarTitle(Text("Chats"), displayMode: .large)
            .edgesIgnoringSafeArea(.top)
        }
        .onAppear {
            let user = self.authState.user
            fetchChats(uid: user!.uid)
        }
    }
}

struct ChatsListView_Previews: PreviewProvider {
    static var authState = AuthState()

    static var previews: some View {
        ChatsListView().environmentObject(self.authState)
    }
}
