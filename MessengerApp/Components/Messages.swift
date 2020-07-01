//
//  Messages.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/30/20.
//

import SwiftUI

struct Messages: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 14) {
                TextBubble()
                ForEach(1...5, id: \.self) { msg in
                    TextBubble()
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
        }
    }
}

struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        Messages()
    }
}
