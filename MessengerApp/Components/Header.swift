//
//  Header.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/30/20.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack {
            GeometryReader { (g) in
                VStack(alignment: .center) {
                    Spacer()
                    HStack(alignment: .center) {
                        Spacer()
                        Text("Henry")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    
                }
            }
            .frame(height: 100)
            .padding(.bottom, 15)

            Divider()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
