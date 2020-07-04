//
//  Input.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/29/20.
//

import SwiftUI

struct Input: View {
    @Binding var input: String
    
    func sendMesssage() {
        
    }

    var body: some View {
        VStack(alignment: .center) {
            GeometryReader { (g) in
                HStack(alignment: .center, spacing: 8) {
                    Spacer()
                    HStack {
                        TextField("Type message here", text: $input)
                            .frame(height: 40)
                            .padding(.horizontal, 20)
                    }
                    .frame(height: 50)
                    .background(Color("gray"))
                    .cornerRadius(50)
                    VStack {}
                        .frame(width: 30, height: 30)
                        .background(Color.blue)
                    Spacer()
                }
                .frame(height: 65)
            }
            .frame(height: 65)
        }
    }
}

struct Input_Previews: PreviewProvider {
    @State static var input = ""

    static var previews: some View {
        Input(input: $input)
    }
}
