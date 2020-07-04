//
//  Created by Henry Paulino on 6/29/20.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        let authState = AuthState()
        authState.listen()
        
        return true
    }
}

@main
struct MessengerAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var authState = AuthState()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(authState)
        }
    }
}
