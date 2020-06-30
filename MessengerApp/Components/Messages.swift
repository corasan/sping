//
//  Messages.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/30/20.
//

import SwiftUI

struct Messages: View {
    var body: some View {
        VStack(alignment: .leading) {
            TextBubble()
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
    }
}

struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        Messages()
    }
}
