//
//  TextBubble.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/30/20.
//

import SwiftUI

struct TextBubble: View {
    var body: some View {
        GeometryReader { (g) in
            HStack {
                Text("Hello, World! Hello, World! Hello, World! Hello, World!")
                    .foregroundColor(.white)
                    .lineLimit(1000)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
            }
            .background(Color(UIColor.systemIndigo))
            .cornerRadius(25)
            .frame(maxWidth: g.size.width / 1.4, alignment: .leading)
        }
    }
}

struct TextBubble_Previews: PreviewProvider {
    static var previews: some View {
        TextBubble()
    }
}
