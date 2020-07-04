//
//  ChatView.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/30/20.
//

import SwiftUI
import FirebaseFirestore

struct ChatRoomView: View {
    var chatRoom: ChatRoom
    var chatRef: CollectionReference
    @State var messages: [[String: Any]] = []
    
    init(chatRoom: ChatRoom) {
        self.chatRoom = chatRoom
        self.chatRef = Firestore.firestore().collection("ChatRooms/\(chatRoom.id)/messages")
    }
    
    func fetchMessages() -> Void {
        self.chatRef.addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("Error getting documents: \(error!)")
                return
            }
            
            let data = documents.map { doc in
                return ["text": doc.get("text") as! String, "sentBy": doc.get("sentBy") as! String]
            }
            self.messages = data
        }
    }

    var body: some View {
        VStack {
            Spacer()
            Messages(messages: self.messages as [NSDictionary])
            Input(chatId: chatRoom.id)
        }
        .modifier(AdaptsToKeyboard())
        .onAppear {
            self.fetchMessages()
        }
    }
}

struct ChatRoomView_Previews: PreviewProvider {
    static var chatRoom = ChatRoom(id: "1", members: ["123", "456"], messages: [], lastMessage: "Hello world!")
    
    static var previews: some View {
        ChatRoomView(chatRoom: self.chatRoom)
    }
}
