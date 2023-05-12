//
//  biometrics_authenticationApp.swift
//  biometrics-authentication
//
//  Created by Silvia España on 11/5/23.
//

import SwiftUI

@main
struct biometrics_authenticationApp: App {
    
    @StateObject var appState = AppState()
    
    var body: some Scene {
        
        WindowGroup {
            
            ZStack {
                if appState.loggedIn {
            ContentView()
                 } else {
                     LoginView(appState: appState)
                 }
            }
        }
    }
}
