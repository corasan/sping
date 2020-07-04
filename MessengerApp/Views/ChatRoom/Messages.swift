//
//  Messages.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/30/20.
//

import SwiftUI

struct Messages: View {
    @EnvironmentObject var authState: AuthState
    var messages: [NSDictionary]
    
    func isThisMe(_ message: NSDictionary) -> Bool {
        if self.authState.user?.uid == message["sentBy"] as? String {
            return true
        }
        return false
    }

    var body: some View {
        ScrollView {
            ForEach(self.messages, id: \.self) { message in
                TextBubble(text: message["text"]! as! String, isMe: isThisMe(message))
            }
        }
        .padding(.horizontal, 16)
    }
}

struct Messages_Previews: PreviewProvider {
    static var messages = [["id": "1", "sentBy": "YIs2kyZ8pwN5Hrp7ETWPj7QLVBv2", "text": "Hello world", "createdAt": "July 1, 2020 at 11:54:00 PM UTC-4", "chatId": "1"]]

    static var previews: some View {
        Messages(messages: self.messages as [NSDictionary])
            .environmentObject(AuthState())
    }
}
