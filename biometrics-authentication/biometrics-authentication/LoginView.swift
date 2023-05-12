//
//  LoginView.swift
//  biometrics-authentication
//
//  Created by Silvia España on 11/5/23.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var appState: AppState
    
    var body: some View {
        
        VStack(spacing: 24) {
            Button(action: {
                
                appState.requestBiometrics()
            }) {
                Text("Iniciar sesión")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.purple, Color.blue]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
        }
        .padding()
    }
}
