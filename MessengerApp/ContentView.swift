//
//  ContentView.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/29/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Header()
            Spacer()
            Input()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
