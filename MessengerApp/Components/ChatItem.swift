//
//  ChatItem.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/30/20.
//

import SwiftUI

struct ChatItem: View {
    var body: some View {
        NavigationLink(destination: ChatRoomView()) {
            HStack {
                VStack {}
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.gray)
                    .cornerRadius(100)
                    .padding(.trailing, 15)
                VStack(alignment: .leading) {
                    Text("My name")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .padding(.bottom, 5)
                    Text("Message preview here")
                }
                Spacer()
            }
            .padding(.vertical, 12)
        }
    }
}

struct ChatItem_Previews: PreviewProvider {
    static var previews: some View {
        ChatItem()
    }
}
