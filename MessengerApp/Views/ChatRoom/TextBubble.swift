//
//  TextBubble.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/30/20.
//

import SwiftUI

struct TextBubble: View {
    var text: String
    var isMe: Bool
    
    init(text: String, isMe: Bool) {
        self.text = text
        self.isMe = isMe
    }
    
    var body: some View {
        HStack {
            if self.isMe {
                Spacer()
            }
            HStack(alignment: .bottom, spacing: 15) {
                Text(self.text)
                    .foregroundColor(.white)
                    .lineLimit(1000)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
            }
            .background(self.isMe ? Color.blue : Color.gray)
            .cornerRadius(20)
            if !self.isMe {
                Spacer()
            }
        }
        .padding(.vertical, 10)
    }
}

struct TextBubble_Previews: PreviewProvider {
    static var text = "Hello world!"

    static var previews: some View {
        TextBubble(text: self.text, isMe: false)
    }
}
