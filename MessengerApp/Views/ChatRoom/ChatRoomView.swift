//
//  ChatView.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/30/20.
//

import SwiftUI
import Combine

struct ChatRoomView: View {
    var chatRoom: ChatRoom
    @State var messageInput = ""
    
    init(chatRoom: ChatRoom) {
        self.chatRoom = chatRoom
    }

    var body: some View {
        VStack {
            Spacer()
            Messages(messages: self.chatRoom.messages)
            Input(input: $messageInput)
        }
        .modifier(AdaptsToKeyboard())
    }
}

struct ChatRoomView_Previews: PreviewProvider {
    static var chatRoom = ChatRoom(id: "1", members: ["123", "456"], messages: [], lastMessage: "Hello world!")
    
    static var previews: some View {
        ChatRoomView(chatRoom: self.chatRoom)
    }
}
