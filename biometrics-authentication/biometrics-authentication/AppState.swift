//
//  AppState.swift
//  biometrics-authentication
//
//  Created by Silvia España on 11/5/23.
//

import Foundation
import SwiftUI
import LocalAuthentication

class AppState: ObservableObject {
    
    @Published var loggedIn = false
    @Published var authorizationError: Error?
    
    let context: LAContext = LAContext()
    var canEvaluate = false
    
    func checkBiometricsAvailability() {
        
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            canEvaluate = context.biometryType != .none
        }
    }
    
    func requestPinAuthentication() {
        
        let reason = "Enter your phone PIN to authenticate"
        
        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason, reply: { (success, error) in
            
            DispatchQueue.main.async {
                if success {
                    self.loggedIn = true
                    self.authorizationError = nil
                } else {
                    self.loggedIn = false
                    self.authorizationError = error
                }
            }
        })
    }
    
    func requestBiometrics() {
        
        checkBiometricsAvailability()
        
        if canEvaluate {
            
            let reason = "Needed to find the secret to Monkey Island"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, error) in
                
                DispatchQueue.main.async {
                    
                    if success {
                        
                        self.loggedIn = success
                        self.authorizationError = error
                    } else if let error = error as? LAError {
                        
                        switch error.code {
                        case .authenticationFailed, .userCancel, .userFallback:
                            
                            self.requestPinAuthentication()
                        default:
                            
                            self.loggedIn = false
                        }
                    } else {
                        
                        print(error ?? "")
                    }
                }
            }
        }
    }
}
