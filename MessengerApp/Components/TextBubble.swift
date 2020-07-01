//
//  TextBubble.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/30/20.
//

import SwiftUI

struct TextBubble: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
            Text("Hello, World! Hello, World! Hello, World! Hello, World!")
                .foregroundColor(.white)
                .lineLimit(1000)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
        }
        .background(Color.blue)
        .cornerRadius(20)
    }
}

struct TextBubble_Previews: PreviewProvider {
    static var previews: some View {
        TextBubble()
    }
}
