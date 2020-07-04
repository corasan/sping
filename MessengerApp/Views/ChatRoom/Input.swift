//
//  Input.swift
//  MessengerApp
//
//  Created by Henry Paulino on 6/29/20.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Input: View {
    @State var input: String = ""
    var chatId: String
    private var messagesRef: CollectionReference
    @EnvironmentObject var authState: AuthState
    
    init(chatId: String) {
        self.chatId = chatId
        self.messagesRef = Firestore.firestore().collection("ChatRooms/\(chatId)/messages")
    }
    
    func sendMesssage() -> Void {
        let doc = self.messagesRef.document()
        let uid = self.authState.user?.uid
        let message = ["id": doc.documentID, "sentBy": uid!, "text": self.input, "chatId": self.chatId, "createdAt": FieldValue.serverTimestamp()] as [String : Any]
        doc.setData(message) { err in
            if let error = err {
                print("Error sending message: \(error)")
            } else {
                self.input = ""
            }
        }
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
                    Button(action: self.sendMesssage) {
                        Text("Send")
                    }
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
        Input(chatId: "1").environmentObject(AuthState())
    }
}
