//
//  ContentView.swift
//  biometrics-authentication
//
//  Created by Silvia España on 11/5/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
        VStack {
            
            Image("lechuck")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            
            Text("Ah...There's nothin' like the hot winds of hell blowin' in your face")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
