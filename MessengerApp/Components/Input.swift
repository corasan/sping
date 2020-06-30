//
//  Input.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/29/20.
//

import SwiftUI

struct Input: View {
    @State var text: String = ""

    var body: some View {
        VStack(alignment: .center) {
            GeometryReader { (g) in
                HStack(alignment: .center, spacing: 8) {
                    Spacer()
                    VStack {}
                        .frame(width: 30, height: 30)
                        .background(Color.red)
                    VStack {}
                        .frame(width: 30, height: 30)
                        .background(Color.blue)
                    HStack {
                        TextField("Type message here", text: $text)
                            .padding(.horizontal, 20)
                    }
                    .frame(height: 50)
                    .background(Color("gray"))
                    .cornerRadius(50)
                    Spacer()
                }
                .frame(height: 65)
            }
            .frame(height: 65)
            .background(Color.white)
        }
    }
}

struct Input_Previews: PreviewProvider {
    static var previews: some View {
        Input()
    }
}
